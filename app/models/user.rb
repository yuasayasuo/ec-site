class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :trackable, :validatable
  has_many :orders, dependent: :destroy
  has_many :books, through: :orders
end
