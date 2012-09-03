class CreateCommonEventFollows < ActiveRecord::Migration
  def change
    create_table :common_event_follows do |t|

      t.timestamps
    end
  end
end
