class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:user_index,:common_event,:person_event,:collect_event,:setting,:about]
  def find_user
  	@user = User.find_by_id(session[:user_id])
  end  
  
  ##�û���ҳ
  def user_index
  	userid=session[:user_id]
	  
	  common_event()
  end
  
  #�����¼�
  def common_event
  	@select_link=0
  	
  end
  
  #�����¼�
  def person_event
  	@select_link=1
  	
  end
  
  #�ҵĹ�ע(�ղ�)
  def collect_event
		@select_link=2
		
  end
  
  #����
  def setting
		@select_link=3
		  
  end
  
  #����
  def about
		@select_link=4
		  
  end
  
  
end
