#encoding:utf-8
class CommonEvent < ActiveRecord::Base
	has_many :CommonEventFollow, :foreign_key => "event_id"
	
	#content
	validates_presence_of :title, :message => "标题内容不能为空"
	validates_length_of :title, :maximum => 15, :message => "内容不能超过15个字"
		
	def IncMsgCount
		self.message_count += 1
  end
end
