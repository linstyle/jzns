class CommonEvent < ActiveRecord::Base
	has_many :common_events_follows
	
 #������Ϣ��
  def add_msg_count(count)
  	self.messge_count+=count
  end
end
