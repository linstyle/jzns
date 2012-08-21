class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:common_event,:common_event_content,:person_event,:follow_event,:setting,:about]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end  
  
  ##用户首页
  def user_index
  	redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  #公共事件
  def common_event
  	@select_link=0
  	
		@events = CommonEvent.order('id desc').page(params[:page]).per(30)				  	
  end
  
  def common_event_content
  	
  end
  
  #点选事件链接
  def click_common_event		
  	redirect_to(:controller=>"user_index",:action => "common_event_content")
  end  
  
  #个人事件
  def person_event
  	@select_link=1
  	
  end
  
  #我的关注(收藏)
  def follow_event
		@select_link=2
		
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
