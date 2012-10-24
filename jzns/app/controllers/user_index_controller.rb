#encoding:utf-8
class UserIndexController < ApplicationController
  before_filter :authenticate_user, :only => [:create_common_event,:del_common_event,:send_common_content,:person_event,:my_event,:my_follow,:my_say,:my_verify,:follow_common_event_add,:follow_common_event_cancel,:setting,:setting_commit,:about]
  
  before_filter :find_user, :only => [:common_event, :common_event_content]
  
  def authenticate_user    
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end  
  
  def find_user
  	if !session[:user_id]
  		return
  	end
  	
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
  		#redirect_to root_url
    end
  end  
  
  ##用户首页ui跳转
  def user_index
  	if '1'==cookies[:remeber_me_check]
			return redirect_to(:controller=>"welcome",:action => "login_by_auto")	
		end
		
		redirect_to(:action => "common_event")
  end
  
  #公共事件
  def common_event
    if @user
  		@select_link=100
  		@new_common_event = CommonEvent.new
    end

		@events = CommonEvent.where("is_pass=1").order('id desc').page(params[:page]).per(DataTemplate::PER_EVENT-1)				  	
  end
  
  #新建公共事件
  def create_common_event    
    new_common_content = CommonEvent.new(params[:common_event])
    new_common_content.author_id = @user.id
    new_common_content.author_nick_name = @user.nick_name
    
		if !new_common_content.save
		  logger.error("Err, ManagerController:new_common_content.save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  #删除公共事件
  def del_common_event
  	#验证是否作者
  	event_id = params[:id]
  	
  	event = CommonEvent.find(event_id)
  	if !event || event.author_id!=@user.id
  		logger.error("Err, del_common_event CommonEvent.find failed userid=#{@user.id},eventid=#{event_id}")
  		return redirect_to(:controller=>"user_index",:action => "common_event")		
    end
    
    if event.destroy
    	logger.error("Err, del_common_event CommonEvent.delete failed userid=#{@user.id},eventid=#{event_id}")
    end
    
    redirect_to(:controller=>"user_index",:action => "common_event")
    
	end
  
  #公共事件具体的内容
  def common_event_content
    #公共部分
  	@event_id = params[:id]
   	@event_contents = CommonEventContent.where(["event_id=?", @event_id]).order('id desc').page(params[:page]).per(10) 	
   	
    if !@user
    	return
    end   	
    
    
   	#需要登陆部分  	
  	event = CommonEvent.find(@event_id)
  	@new_event_content = CommonEventContent.new  	
  	
  	#判断是否作者
  	@is_author = event.author_id==@user.id 
  	
  	#判断是否通过审核，否则只有作者可以看  	
  	if !event || (event.is_pass!=1 && !@is_author)
  		logger.error("Err, common_event_content:content don't verify or exist.userid=#{@user.id},eventid=#{@event_id}")
  		  		
  		return redirect_to(:controller=>"user_index",:action => "common_event")
    end
		  	
  	#判断是否已关注该内容
  	@is_follow = CommonEventFollow.where(["author_id=? and event_id=?", @user.id, @event_id]).limit(1)

  end  
       
  #关注公共事件
  def follow_common_event_add
  	common_events_follow = CommonEventFollow.new
  	common_events_follow.author_id = @user.id
  	common_events_follow.event_id = params[:id]  
 	
		if !common_events_follow.save
		  logger.error("Err, follow_common_event save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>params[:id])
  end
  
  #取消关注公共事件
  def follow_common_event_cancel
  	event_id = params[:id]
   	CommonEventFollow.delete_all(:author_id=>@user.id, :event_id=>event_id)

   	redirect_to(:action => "common_event_content", :id=>event_id)
  end
  
  #消息发送.公共事件
  def send_common_content
    event_id = params[:id]
  	@new_common_content = CommonEventContent.new(params[:common_event_content])
  	
  	@new_common_content.event_id = event_id
  	@new_common_content.author_id = @user.id
  	@new_common_content.author_nick_name = @user.nick_name

	  if @new_common_content.save
	  	flash[:notice] = "消息成功发送"
	  	event = CommonEvent.find(event_id)	  	
	  	event.IncMsgCount if event
	  	if !event.save
	  		logger.error("Err, send_common_content:event.msgcount save failed,userid=#{@user.id},eventid=#{event_id}") 	
	    end	  	
	  else
	    flash[:notice] = "消息发送失败"+@new_common_content.errors.full_messages.to_s
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>event_id)
	 	 
  end      
  
  #个人事件
  def person_event
  	
  	
  end
  
  #我的..	
  def my_event
  	@select_link=200
  	@select_down_menu=200
  	@select_my_event=params[:my_event_class].to_i

  	if 201==@select_my_event	#成功发表
	 		@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ?  and is_pass=1", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)  		  	
	 		
  	elsif 202==@select_my_event	#审核中
	 		@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ?  and is_pass=2", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT) 
	 		 	
  	elsif 203==@select_my_event	#审核失败
	 		@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ?  and is_pass=0", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)
	 	
	 	else
	 		@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ? ", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)  		 	   	
    end
 		 		
	end
	
  def my_follow
  	@select_link=200
  	@select_down_menu=210
  	
 		@events = CommonEvent.joins(:CommonEventFollow).select('id,title,author_nick_name, message_count').order('id desc').where(["`common_event_follows`.`author_id` = ?", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)	 	  	
	end
	
	def my_say
		@select_link=200
		@select_down_menu=220
		
 		@events = CommonEvent.joins(:CommonEventFollow).select('id,title,message_count').order('id desc').where(["`common_event_follows`.`author_id` = ?", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)			
  end
  
  #设置
  def setting
		@select_link=300
		@user_setting = User.new				  
  end
  
  def setting_commit
    new_nick_name = params[:new_nick_name]
    old_password = params[:old_password]
    new_password = params[:password]
    new_password_confirmation = params[:password_confirmation]
		
		#改昵称
		if @user.nick_name != new_nick_name
			if @user.update_attributes(:nick_name=> new_nick_name)
				#更新common_events表
				#　result = Product.update_all("price = 1.1*price", "title like '%Java%'")
				CommonEvent.update_all(["author_nick_name=?",new_nick_name], ["author_id=? and datediff( current_timestamp(),insert_time )<5",@user.id])
				
				#更新common_event_contents表
				CommonEventContent.update_all(["author_nick_name=?",new_nick_name], ["author_id=? and datediff( current_timestamp(),insert_time )<5",@user.id])
			else
				logger.error("Err, setting update_attributes nick_name failed. userid:#{@user.id}")
			end						
	  end
	  
	  #改密码
	  if old_password!=""
	  	if @user.authenticate(old_password) 
	  		@user.password = new_password
	  		@user.password_confirmation = new_password_confirmation	  	 
	  	  
				if !@user.update_attributes(:password=>new_password, :password_confirmation=>new_password_confirmation)
					logger.error("Err, setting update_attributes password failed. userid:#{@user.id}")	
					return render(:action =>"setting")				
				end
			else
			  flash[:notice]="旧的密码不正确"
	    end
	  end
		 
		#if @user.contact_me != @user_setting.contact_me
		  #更新user表
		#	if !@user.update_attributes(:contact_me=>@user_setting.contact_me)
		#		logger.error("Err, setting update_attributes contact_me failed. userid:#{@user.id}")	
		#		return render(:action =>"setting")
		#	end
	  #end

		render(:action => "setting")
  end
  
  #关于
  def about
		@select_link=400
		  
  end
  
  #link_退出
  def logout  	
  	reset_session
 
 		if '1'==cookies[:remeber_me_check] 
 			cookies.delete :remeber_me_check
 			cookies.delete :remember_me_id
 			cookies.delete :remember_me_code
 	  end

  	redirect_to(:controller=>"welcome",:action => "index")
  end

end