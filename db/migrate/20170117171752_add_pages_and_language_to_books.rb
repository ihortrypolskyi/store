class AddPagesAndLanguageToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :pages, :string
    add_column :books, :language, :string
    add_column :books, :in_stock, :boolean
  end
end
