#encoding:utf-8
class CommonEventContent < ActiveRecord::Base
 	#photo限制
  attr_accessible :photo
  has_attached_file :photo, :styles => { :medium => "300x300>", :thumb => "130x130>" }

	validates_attachment_content_type :photo,    
  :allow_nil => true,
  :content_type => [ 'image/jpg','image/jpeg', 'image/bmp', 'image/png'],   
  :message=>"请上传jpg,bmp,png格式图片"
  
  
  validates_attachment_size :photo,
  :less_than => 2048.kilobytes,
  :message=>"请上传大小2MB以内图片"
 
  attr_accessible :msg_content
	#content
	validates_presence_of :msg_content, :message => "发送内容不能为空"
	validates_length_of :msg_content, :maximum => 200, :message => "内容不能超过200个字"
end
