class AddImageToBookAndAuthor < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :image, :string
    add_column :authors, :image, :string
  end
end
