#encoding:utf-8
class User < ActiveRecord::Base
	attr_protected :is_pm
	
	set_primary_key "id" 

	#id(name)
	validates_presence_of :name, :message => "登陆账号不能为空"
	validates_format_of :name, :with => /\A([\w\.%\+\-]+)@([\w\-]+\.)+([\w]{2,})\z/i
	
	validates_uniqueness_of :name, :on => :create, :message => "您的登陆账号已被他人使用"
	validates_length_of :name, :maximum => 32, :message => "长度在32个字符内"
	
	#昵称(nick_name)
	validates_presence_of :nick_name, :message => "昵称不能为空"
	#validates_uniqueness_of :nick_name, :message => "您的昵称已被他人使用"
	#validates_format_of :nick_name, :with =>  /\w/, :message => "昵称只能为中英文、数字"
	validates_length_of :nick_name, :in => 0..10, :message => "昵称长度不超过10位"
	
	validates_uniqueness_of :nick_name, :on => :update
	
	#联系方式(contact_me)
	validates_length_of :contact_me, :maximum => 48, :message => "长度在48个字符内"
	
	#密码(password)
	validates_presence_of :password, :on => :create, :message => "密码不能为空"
	validates_length_of :password, :on => :create, :in => 6..15, :message => "密码长度在6-15"
	
 	has_secure_password
 	#确认两次是否一样
  validates_presence_of :password,:on => :create, :message => "两次输入密码不一致"	
  
 
  def find_by_name(name)
  	find( :first, :conditions => ["name=?", name] )
  end
end
 