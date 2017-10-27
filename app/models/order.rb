class Order < ApplicationRecord
  belongs_to :user
  has_many :details, dependent: :destroy
  #has_many :books, through: :details
  enum status: {ordered: 0, paid: 1, delivered: 2}
end
