class CreateRelations < ActiveRecord::Migration[5.1]
  def change
    create_table :relations do |t|
      t.integer :profile_id
      t.integer :target_profile_id
      t.string :status

      t.timestamps
    end
  end
end
