class Product < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    with_options numericality: { other_than: 0 } do
      validates :category_id
      validates :product_condition_id
      validates :shopping_charge_id
      validates :prefecture_id
      validates :shopping_day_id
    end
    validates :price, numericality: { only_integer: true }
  end
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user, foreign_key: 'user_id'
  has_one :order
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shopping_charge
  belongs_to :prefecture
  belongs_to :shopping_day
end
