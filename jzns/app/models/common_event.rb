class CommonEvent < ActiveRecord::Base
	has_many :CommonEventsContents
	
 #������Ϣ��
  def add_msg_count(count)
  	self.messge_count+=count
  end
end
