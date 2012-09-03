#encoding:utf-8
class CommonEventContent < ActiveRecord::Base
	#content
	validates_presence_of :content, :message => "发送内容不能为空"
	validates_length_of :content, :maximum => 140, :message => "内容不能超过140个字"
	
  attr_accessible :avatar
  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100>" }	
end
