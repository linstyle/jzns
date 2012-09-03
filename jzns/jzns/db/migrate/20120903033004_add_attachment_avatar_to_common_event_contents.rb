class AddAttachmentAvatarToCommonEventContents < ActiveRecord::Migration
  def self.up
    change_table :common_event_contents do |t|
      t.has_attached_file :avatar
    end
  end

  def self.down
    drop_attached_file :common_event_contents, :avatar
  end
end
