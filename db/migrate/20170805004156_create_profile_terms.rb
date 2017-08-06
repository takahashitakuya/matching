class CreateProfileTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :profile_terms do |t|
      t.integer :profile_id
      t.integer :term_id

      t.timestamps
    end
  end
end
