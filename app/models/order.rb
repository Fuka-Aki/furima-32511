class Order < ApplicationRecord
  belongs_to :user,    foreign_key: 'user_id'
  belongs_to :product, foreign_key: 'product_id'
  has_one :address
end
