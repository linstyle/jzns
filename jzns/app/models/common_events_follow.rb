class CommonEventsFollow < ActiveRecord::Base
		belongs_to :common_events, :foreign_key => "user_id"
end
