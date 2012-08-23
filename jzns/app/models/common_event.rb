class CommonEvent < ActiveRecord::Base
	has_many :common_events_follows
	
 #增加消息数
  def add_msg_count(count)
  	self.messge_count+=count
  end
end
