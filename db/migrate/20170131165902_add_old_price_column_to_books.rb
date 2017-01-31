class AddOldPriceColumnToBooks < ActiveRecord::Migration[5.0]
  def change
    add_column :books, :old_price, :integer
  end
end
