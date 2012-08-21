class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:common_event,:common_event_content,:person_event,:follow_event,:setting,:about]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end  
  
  ##�û���ҳ
  def user_index
  	redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  #�����¼�
  def common_event
  	@select_link=0
  	
		@events = CommonEvent.order('id desc').page(params[:page]).per(30)				  	
  end
  
  def common_event_content
  	
  end
  
  #��ѡ�¼�����
  def click_common_event		
  	redirect_to(:controller=>"user_index",:action => "common_event_content")
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
  

  
  
end
