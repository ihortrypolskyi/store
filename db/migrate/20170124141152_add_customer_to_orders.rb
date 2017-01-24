class AddCustomerToOrders < ActiveRecord::Migration[5.0]
  def change
    add_column :orders, :customer_first_name, :string
    add_column :orders, :customer_last_name, :string
    add_column :orders, :customer_phone_number, :string
    add_column :orders, :customer_email, :string
    add_column :orders, :customer_house, :string
    add_column :orders, :customer_city, :string
    add_column :orders, :customer_postal_code, :string
  end
end