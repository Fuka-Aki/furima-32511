class Address < ApplicationRecord
  belongs_to :order, foreign_key: 'order_id'
end
