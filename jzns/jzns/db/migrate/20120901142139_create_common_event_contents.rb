class CreateCommonEventContents < ActiveRecord::Migration
  def change
    create_table :common_event_contents do |t|

      t.timestamps
    end
  end
end
