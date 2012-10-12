class AddAttachmentPhotoToCommonEventContents < ActiveRecord::Migration
  def self.up
    change_table :common_event_contents do |t|
      t.has_attached_file :photo
    end
  end

  def self.down
    drop_attached_file :common_event_contents, :photo
  end
end
