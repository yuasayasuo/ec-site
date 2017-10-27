class AddDetailsToOrder < ActiveRecord::Migration[5.1]
  def change
    add_reference :orders, :detail, foreign_key: true
  end
end
