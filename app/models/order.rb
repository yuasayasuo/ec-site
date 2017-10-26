class Order < ApplicationRecord
  belongs_to :user
  belongs_to :book
  enum status: {ordered: 0, paid: 1, delivered: 2}
end
