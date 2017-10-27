class RemoveBookFormOrder < ActiveRecord::Migration[5.1]
  def change
    remove_foreign_key :orders, :books
    remove_reference :orders, :book, index: true
  end
end
