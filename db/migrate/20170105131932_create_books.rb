class CreateBooks < ActiveRecord::Migration[5.0]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.integer :price
      t.integer :year
      t.string :isbn

      t.timestamps
    end
  end
end
