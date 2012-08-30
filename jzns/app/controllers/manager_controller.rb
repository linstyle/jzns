class ManagerController < ApplicationController
  before_filter :find_user, :only => []
  
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
    
    
  end
  
  
end
