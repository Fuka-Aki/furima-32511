class Product < ApplicationRecord
  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :category_id,          numericality: { other_than: 0, message: "can't be blank" }
    validates :product_condition_id, numericality: { other_than: 0, message: "can't be blank" }
    validates :shopping_charge_id,   numericality: { other_than: 0, message: "can't be blank" }
    validates :prefecture_id,        numericality: { other_than: 0, message: "can't be blank" }
    validates :shopping_day_id,      numericality: { other_than: 0, message: "can't be blank" }
    validates :price,                numericality: { only_integer: true, message: 'is invalid' }
    validates :user
  end

  belongs_to :user, foreign_key: 'user_id'
  has_one_attached :image
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :product_condition
  belongs_to :shopping_charge
  belongs_to :prefecture
  belongs_to :shopping_day
end
