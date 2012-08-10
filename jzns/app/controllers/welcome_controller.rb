#encoding:utf-8
class WelcomeController < ApplicationController
  #用户首页
  def index
		@user = User.new

	  if '1'==cookies[:remeber_me_check]
			user_fromcookies = User.find_by_id( cookies[:remember_me_id] )
			
			if user_fromcookies && Digest::SHA1.hexdigest( user_fromcookies.name )[3,18] == cookies[:remember_me_code]
				session[:user_id] = user_fromcookies.id 
				login_process(user_fromcookies)
				redirect_to(:action => "user_index")
			end
		end
		
  end
  
  #登陆
  def login	
		@user_params = User.new(params[:user])
		user = User.find_by_name(@user_params.name)
		if user && user.status==0 && user.authenticate(@user_params.password) 
			login_by_login_create(user, params[:remember_me_check])
		else
			flash[:notice] =  "无效的用户名或密码"
			redirect_to(:action => "index")
		end		  
	end  
  
  #处理登陆需要做的事情
	def login_process(user)
		#更新登陆时间
		if !user.update_attribute("lastlogin_time", Time.now)
			logger.error("update lastlogin_time failed. userid:#{user.id}")
		end			
	  #显示消息类型默认为0
  end 
	
	def login_by_login_create(user, check_me)
		login_process(user)
		#保存cookies
		if check_me
			cookies[:remeber_me_check] = {:value=>1.to_s, :expires => 7.days.from_now}
			userid_str = (user.id).to_s
			cookies[:remember_me_id] = { :value => userid_str, :expires => 7.days.from_now }    
			usercode_encry = Digest::SHA1.hexdigest( user.name )[3,18]    
			cookies[:remember_me_code] = { :value => usercode_encry, :expires => 7.days.from_now }
		end  
			  
		session[:user_id] = user.id
		redirect_to(:action => "user_index")
  end
  	  
end
