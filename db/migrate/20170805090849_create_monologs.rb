class CreateMonologs < ActiveRecord::Migration[5.1]
  def change
    create_table :monologs do |t|
      t.integer :profile_id
      t.text :body

      t.timestamps
    end
  end
end
