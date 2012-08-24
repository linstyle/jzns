class CommonEvent < ActiveRecord::Base
	has_many :CommonEventsFollows, :foreign_key => "event_id"
	
 #增加消息数
  def add_msg_count(count)
  	self.messge_count+=count
  end
end
