#encoding:utf-8
class CommonEventsContent < ActiveRecord::Base
	belongs_to :CommonEvent, :foreign_key => "event_id"

	#content
	validates_presence_of :content, :message => "发送内容不能为空"
	validates_length_of :content, :maximum => 140, :message => "内容不能超过140个字"
end
