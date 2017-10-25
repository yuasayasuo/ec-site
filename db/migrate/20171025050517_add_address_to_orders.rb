class AddAddressToOrders < ActiveRecord::Migration[5.1]
  def change
    add_column :orders, :address, :string
    add_column :orders, :quantity, :integer
  end
end
