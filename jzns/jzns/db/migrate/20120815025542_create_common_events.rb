class CreateCommonEvents < ActiveRecord::Migration
  def change
    create_table :common_events do |t|

      t.timestamps
    end
  end
end
