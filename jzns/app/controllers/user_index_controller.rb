class UserIndexController < ApplicationController
  before_filter :find_user, :only => [:common_event,:common_event_content,:person_event,:follow_event,:follow_common_event_add,:follow_common_event_cancel,:setting,:about]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end  
  
  ##�û���ҳui��ת
  def user_index
  	redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  #�����¼�
  def common_event
  	@select_link=0
  	
		@events = CommonEvent.order('id desc').page(params[:page]).per(30)				  	
  end
  
  def common_event_content
  	event_id = params[:id]
  	@new_event_content = CommonEventsContent.new
  	@event_contents = CommonEventsContent.where(:event_id=>event_id)
  	
  	
  	#�ж��Ƿ��ѹ�ע������
  	@is_follow = CommonEventsFollow.where(["user_id=? and event_id=?", @user.id, @event_id]).limit(1)
  	
  	@messages = CommonEventsContent.where(["event_id=?", @event_id]).page(params[:page]).per(10)

  end  
       
  
  #�����¼�
  def person_event
  	@select_link=1
  	
  end
  
  #�ҵĹ�ע(�ղ�)
  def follow_event
		@select_link=2
	
		@events = CommonEvent.joins(:CommonEventsFollows).select('id,title,message_count').order('id desc').where(["`common_events_follows`.`user_id` = ?", @user.id]).page(params[:page]).per(30)	
  end
  
  #��ע�����¼�
  def follow_common_event_add
  	common_events_follow = CommonEventsFollow.new
  	common_events_follow.user_id = @user.id
  	common_events_follow.event_id = params[:id]  

 	
		if !common_events_follow.save
		  logger.error("Err, follow_common_event save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:action => "common_event_content", :id=>params[:id])
  end
  
  #ȡ����ע�����¼�
  def follow_common_event_cancel
  	event_id = params[:id]
   	CommonEventsFollow.delete_all(:user_id=>@user.id, :event_id=>event_id)

   	redirect_to(:action => "common_event_content", event_id)
  end
  
  @new_event_content = CommonEventsContent.new
  #��Ϣ����.����
  def send_common_content
    event_id = params[:id]
  	new_common_content = CommonEventsContent.new(params[:message])
  	
	  if new_common_content.save
	  		flash[:notice] = "��Ϣ�ɹ�����"
	  else
	    flash[:notice] = "��Ϣ����ʧ��,�鿴�����Ƿ�"
	  end

	 	redirect_to(:action => "common_event_content", :id=>params[:id]) 	
  end
  
  #����
  def setting
		@select_link=3
		  
  end
  
  #����
  def about
		@select_link=4
		  
  end
  
  #link_�˳�
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
