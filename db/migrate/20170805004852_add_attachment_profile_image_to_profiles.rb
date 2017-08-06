class AddAttachmentProfileImageToProfiles < ActiveRecord::Migration[5.0]
  def self.up
    change_table :profiles do |t|
      t.attachment :profile_image
    end
  end

  def self.down
    remove_attachment :profiles, :profile_image
  end
end
