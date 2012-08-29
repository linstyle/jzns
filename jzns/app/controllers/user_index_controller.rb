#encoding:utf-8
class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:common_event,:common_event_content,:person_event,:follow_event,:follow_common_event_add,:follow_common_event_cancel,:setting,:about]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end  
  
  ##用户首页ui跳转
  def user_index
  	redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  #公共事件
  def common_event
  	@select_link=0
  	
		@events = CommonEvent.order('id desc').page(params[:page]).per(30)				  	
  end
  
  def common_event_content
  	@event_id = params[:id]
  	@new_event_content = CommonEventsContent.new
  	@event_contents = CommonEventsContent.where(:event_id=>@event_id)
  	
  	
  	#判断是否已关注该内容
  	@is_follow = CommonEventsFollow.where(["user_id=? and event_id=?", @user.id, @event_id]).limit(1)
  	
  	@messages = CommonEventsContent.where(["event_id=?", @event_id]).order('id desc').page(params[:page]).per(10)

  end  
       
  
  #个人事件
  def person_event
  	@select_link=1
  	
  end
  
  #我的关注(收藏)
  def follow_event
		@select_link=2
	
		@events = CommonEvent.joins(:CommonEventsFollows).select('id,title,message_count').order('id desc').where(["`common_events_follows`.`user_id` = ?", @user.id]).page(params[:page]).per(30)	
  end
  
  #关注公共事件
  def follow_common_event_add
  	common_events_follow = CommonEventsFollow.new
  	common_events_follow.user_id = @user.id
  	common_events_follow.event_id = params[:id]  
 	
		if !common_events_follow.save
		  logger.error("Err, follow_common_event save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>params[:id])
  end
  
  #取消关注公共事件
  def follow_common_event_cancel
  	event_id = params[:id]
   	CommonEventsFollow.delete_all(:user_id=>@user.id, :event_id=>event_id)

   	redirect_to(:action => "common_event_content", :id=>event_id)
  end
  
  
  #消息发送.公共
  def send_common_content
    event_id = params[:id]
  	new_common_content = CommonEventsContent.new(params[:common_events_content])
  	
  	new_common_content.event_id = event_id

	  if new_common_content.save
	  	flash[:notice] = "消息成功发送"
	  	event = CommonEvent.find(event_id)	  	
	  	event.IncMsgCount if event
	  	if !event.save
	  		logger.error("Err, send_common_content:event.msgcount save failed,userid=#{@user.id},eventid=#{event_id}") 	
	    end	  	
	  else
	    flash[:notice] = "消息发送失败,查看内容是否为空"
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>event_id)
	 	 
  end
  
  #设置
  def setting
		@select_link=3
		  
  end
  
  #关于
  def about
		@select_link=4
		  
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