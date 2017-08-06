class CreateProfiles < ActiveRecord::Migration[5.1]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :display_name
      t.text :description
      t.string :policy
      t.string :catch_copy
      t.text :content
      t.string :website
      t.string :postal_code
      t.string :address_pref
      t.string :address_city
      t.string :address_number
      t.string :address_building
      t.string :address_full

      t.timestamps
    end
  end
end
