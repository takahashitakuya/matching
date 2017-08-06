class AddImagesIdToProfile < ActiveRecord::Migration[5.1]
  def change
    add_column :profiles, :user_icon_id, :integer
    add_column :profiles, :main_cover_id, :integer
  end
end
