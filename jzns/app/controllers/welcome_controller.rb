#encoding:utf-8
class WelcomeController < ApplicationController	
  #用户首页
  def index		
	  if '1'==cookies[:remeber_me_check]
			return login_by_auto()
		end

		@user = User.new
  end
  
  #登陆
  def login
		@user_params = User.new(params[:user])
		login_by_hand(@user_params, params[:remember_me_check])
	end 
	
	#注册
  def create
	  @user = User.new(params[:user])	
	  #昵称默认用邮箱前缀	 
	  @user.nick_name = /[^@]+/.match(@user.name)[0] 
	  
	  if @user.save
	    login_by_create(@user)
	  else
	    render :action => :index
	  end
  end
  
  #最后跳转的登陆函数
	def login_process(user)
		#更新登陆时间
		if !user.update_attribute("lastlogin_time", Time.now)
			logger.error("login_process:update lastlogin_time failed. userid:#{user.id}")
		end
		
		session[:user_id] = user.id
	  redirect_to(:controller=>"user_index",:action => "user_index")
  end   	
	
	#三种登陆方式,最后都调用login_process函数
	#1)手动输入登陆
	#2)自动登陆
	#3)创号登陆	
	def login_by_hand(user_param, b_remember_me)
		user = User.find_by_name(user_param.name)
		
		if user && user.authenticate(user_param.password) 
			#记录cook
			if b_remember_me
				rember_cook(user)
			end
			
			return login_process(user)	
		else
			flash[:notice] =  "无效的用户名或密码"
			redirect_to(:action => "index")
		end		
	end

	def login_by_auto
		user_fromcookies = User.find_by_id( cookies[:remember_me_id] )

		if user_fromcookies && Digest::SHA1.hexdigest( user_fromcookies.name )[3,18] == cookies[:remember_me_code]
			session[:user_id] = user_fromcookies.id 
			login_process(user_fromcookies)			
		end	
  end
  
  def login_by_create(user)
  	rember_cook(user)
  	login_process(user)
	end
  
	def rember_cook(user)
		cookies[:remeber_me_check] = {:value=>1.to_s, :expires => 7.days.from_now}
		userid_str = (user.id).to_s
		cookies[:remember_me_id] = { :value => userid_str, :expires => 7.days.from_now }    
		usercode_encry = Digest::SHA1.hexdigest( user.name )[3,18]    
		cookies[:remember_me_code] = { :value => usercode_encry, :expires => 7.days.from_now }		
  end
  	  
end
