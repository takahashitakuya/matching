class AddAttachmentCoverImageToProfiles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :profiles do |t|
      t.attachment :cover_image
    end
  end

  def self.down
    remove_attachment :profiles, :cover_image
  end
end
