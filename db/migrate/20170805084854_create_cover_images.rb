class CreateCoverImages < ActiveRecord::Migration[5.1]
  def change
    create_table :cover_images do |t|
      t.integer :profile_id
      t.string :caption

      t.timestamps
    end
  end
end
