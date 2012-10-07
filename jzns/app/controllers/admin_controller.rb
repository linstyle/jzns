class AdminController < ApplicationController
  before_filter :find_user, :only => [:index]
  
  def find_user
  	@user = User.find_by_id(session[:user_id])
  	if !@user || @user.is_pm!=true
  		redirect_to(:controller=>"welcome",:action => "index")
    end
  end
  
  def index
  	@select_link = 999
  	@select_admin_class = 901
  	
	 	@events = CommonEvent.select('id,title,author_nick_name, message_count').order('id desc').where(["`common_events`.`author_id` = ?  and is_pass=0", @user.id]).page(params[:page]).per(DataTemplate::PER_EVENT)   	
  
	end
	
	#Í¨¹ýÉóºË
	def ok_verify
	
		redirect_to(:controller=>"admin",:action => "index")
  end

end
