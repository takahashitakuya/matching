class AddAttachmentImageToCoverImages < ActiveRecord::Migration[5.1]
  def self.up
    change_table :cover_images do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :cover_images, :image
  end
end
