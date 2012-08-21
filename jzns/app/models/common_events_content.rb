class CommonEventsContent < ActiveRecord::Base
	belongs_to :CommonEvent, :foreign_key => "event_id"

	#content
	validates_presence_of :content, :message => "�������ݲ���Ϊ��"
	validates_length_of :content, :maximum => 140, :message => "���ݲ��ܳ���140����"
end
