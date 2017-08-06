class CreateTerms < ActiveRecord::Migration[5.1]
  def change
    create_table :terms do |t|
      t.string :name
      t.string :taxonomy
      t.string :slug
      t.string :description
      t.string :count
      t.string :parent

      t.timestamps
    end
  end
end
