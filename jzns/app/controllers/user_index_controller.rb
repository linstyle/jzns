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
  	@event_contents = CommonEventsContent.where(:event_id=>@event_id)
  	
  	
  	#判断是否已关注该内容
  	@is_follow = CommonEventsFollow.where(["user_id=? and common_event_id=?", @user.id, @event_id]).limit(1)
  	  	
  end  
       
  
  #个人事件
  def person_event
  	@select_link=1
  	
  end
  
  #我的关注(收藏)
  def follow_event
		@select_link=2
		
  end
  
  #关注公共事件
  def follow_common_event_add
  	common_events_follow = CommonEventsFollow.new
  	common_events_follow.user_id = @user.id
  	common_events_follow.common_event_id = params[:id]  

 	
		if !common_events_follow.save
		  logger.error("Err, follow_common_event save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>params[:id])
  end
  
  def follow_common_event_cancel
  	event_id = params[:id]
   	CommonEventsFollow.delete(["user_id=? and common_event_id=?", @user.id, event_id])
   	redirect_to(:action => "common_event_content", :id=>params[:id])
  end
  
  #设置
  def setting
		@select_link=3
		  
  end
  
  #关于
  def about
		@select_link=4
		  
  end
  

  
  
end
