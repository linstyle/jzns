class CreateCommonEventsFollows < ActiveRecord::Migration
  def change
    create_table :common_events_follows do |t|

      t.timestamps
    end
  end
end
