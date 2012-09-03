class CreatePersonEvents < ActiveRecord::Migration
  def change
    create_table :person_events do |t|

      t.timestamps
    end
  end
end
