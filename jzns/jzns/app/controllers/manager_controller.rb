class ManagerController < ApplicationController
  before_filter :find_user, :only => [:create_common_event]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end
  
   
  def create_common_event
  	if @user.id!=DataTemplate::ADMIN_ID 
  		redirect_to(:controller=>"welcome",:action => "index")  	
    end
    
    new_common_content = CommonEvent.new(params[:common_event])
    
		if !new_common_content.save
		  logger.error("Err, ManagerController:new_common_content.save failed,userid=#{@user.id}") 
	  end
	  
	  redirect_to(:controller=>"user_index",:action => "common_event")
  end
  
  
end
