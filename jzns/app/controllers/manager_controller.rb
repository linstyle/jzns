class ManagerController < ApplicationController
  before_filter :find_user, :only => [:create_common_event]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end
  
   

  
  
end
