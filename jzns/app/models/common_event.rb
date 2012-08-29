class CommonEvent < ActiveRecord::Base
	has_many :CommonEventsFollows, :foreign_key => "event_id"
	
	def IncMsgCount
		self.message_count += 1
  end
end
