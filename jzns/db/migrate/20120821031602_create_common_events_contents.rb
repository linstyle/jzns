class CreateCommonEventsContents < ActiveRecord::Migration
  def change
    create_table :common_events_contents do |t|

      t.timestamps
    end
  end
end
