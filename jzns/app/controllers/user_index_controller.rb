class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:user_index,:common_event,:person_event,:follow_event,:setting,:about]
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
  	
		@events = CommonEvent.order('id desc').page(params[:page]).per(30)  	
		
		
  	
  end
  
  #�����¼�
  def person_event
  	@select_link=1
  	
  end
  
  #�ҵĹ�ע(�ղ�)
  def follow_event
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
  
  #��ѡ�¼�����
  def click_common_event(id)
  	
  end
  
  
end
