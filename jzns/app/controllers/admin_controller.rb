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
  	
	 	@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ?  and is_pass=2", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)   	
  
	end
	
	#ÉóºË±íµ¥
	def verify
		if params[:bt_ok]
			return ok_verify()
	  end
	  
	  if params[:bt_no]
	  	return fail_verify()
	  end
	
  end
	
	#Í¨¹ýÉóºË
	def ok_verify
		event_ids = params[:ok_verify_ids]
		
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
  
	#ÉóºËÊ§°Ü
	def fail_verify
		event_ids = params[:ok_verify_ids]
		
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

end
