class UserIndexController < ApplicationController
  before_filter :find_user, :only => [ :user_index]
  def find_user
  	@user = User.find_by_id(session[:user_id])
  end  
  
  ##�û���ҳ
  def user_index
  	userid=session[:user_id]
	  
  end
end
