#encoding:utf-8
class CommonEventContent < ActiveRecord::Base
  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  
	#content
	validates_presence_of :content, :message => "发送内容不能为空"
	validates_length_of :content, :maximum => 140, :message => "内容不能超过140个字"
end
