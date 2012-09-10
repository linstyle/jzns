#encoding:utf-8
class CommonEventContent < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "130x130>" }
  
  attr_accessible :msg_content
	#content
	validates_presence_of :msg_content, :message => "发送内容不能为空"
	validates_length_of :msg_content, :maximum => 140, :message => "内容不能超过140个字"
end
