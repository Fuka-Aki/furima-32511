class OrderAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number, :product_id, :user_id, :token

  with_options presence: true do
    # Addressモデルに関してのバリデーション
    validates :postal_code,    format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :prefecture_id,  numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :phone_number,   format: { with: /\A[0-9]{11}\z/}
    validates :token
  end

  def save
    order = Order.create(user_id: user_id, product_id: product_id)
    Address.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, house_number: house_number,
                   phone_number: phone_number, order_id: order.id)
  end
end