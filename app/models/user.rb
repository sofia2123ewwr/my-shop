class User < ApplicationRecord
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_one :cart, dependent: :destroy
  has_many :addresses, dependent: :destroy
  has_many :orders
end
