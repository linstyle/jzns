class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:user_index,:common_event,:person_event,:collect_event,:setting,:about]
  def find_user
  	@user = User.find_by_id(session[:user_id])
  end  
  
  ##用户首页
  def user_index
  	userid=session[:user_id]
	  
	  common_event()
  end
  
  #公共事件
  def common_event
  	@select_link=0
  	
  end
  
  #个人事件
  def person_event
  	@select_link=1
  	
  end
  
  #我的关注(收藏)
  def collect_event
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
