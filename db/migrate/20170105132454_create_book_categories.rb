class CreateBookCategories < ActiveRecord::Migration[5.0]
  def change
    create_table :book_categories do |t|
      t.belongs_to :book, index: true, foreign_key: true
      t.belongs_to :category,index: true, foreign_key: true

      t.timestamps
    end
  end
end
