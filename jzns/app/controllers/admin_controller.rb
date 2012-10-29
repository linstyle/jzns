#encoding:utf-8
class AdminController < ApplicationController
  before_filter :find_user, :only => [:index]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user || @user.is_pm!=true
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end
  
  def index
  	@select_link = 999
  	@select_admin_class = 901
  	
	 	@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where("is_pass=2").page(params[:page]).per(DataTemplate::PER_EVENT)   	
  
	end
	
	#审核表单
	def verify
		if params[:bt_ok]
			return ok_verify()
	  end
	  
	  if params[:bt_no]
	  	return fail_verify()
	  end
	
  end
	
	#通过审核
	def ok_verify
		event_ids = params[:ok_verify_ids]
		if !event_ids
			return redirect_to(:controller=>"admin",:action => "index")
	  end
		
		event_ids.each do |event_id|
			event = CommonEvent.find(event_id)
			if !event
				logger.error("Err, :ok_verify no find event_id:#{event_id}")	
		  end
		  
			if !event.update_attributes(:is_pass=>1)
				logger.error("Err, :ok_verify update_attributes is_pass failed. event_id:#{event_id}")	
			end
		end
		redirect_to(:controller=>"admin",:action => "index")
  end
  
	#审核失败
	def fail_verify
		event_ids = params[:ok_verify_ids]
		if !event_ids
			return redirect_to(:controller=>"admin",:action => "index")
	  end		
		
		event_ids.each do |event_id|
			event = CommonEvent.find(event_id)
			if !event
				logger.error("Err, :ok_verify no find event_id:#{event_id}")	
		  end
		  
			if !event.update_attributes(:is_pass=>0)
				logger.error("Err, :ok_verify update_attributes is_pass failed. event_id:#{event_id}")	
			end
		end
		redirect_to(:controller=>"admin",:action => "index")
  end  
  
  #删除事件里面的内容
  def del_common_event_content
	  event_id = params[:event_id]
	  content_id = params[:content_id]
	   
		CommonEventContent.update_all(["is_del=true"], ["id=?", content_id])
		redirect_to(:controller=>"user_index", :action => "common_event_content", :id=>event_id)
  end

end
