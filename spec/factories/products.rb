FactoryBot.define do
  factory :product do
    name                  { "Test" }
    description           { "Test" }
    category_id           { 1 }
    product_condition_id  { 1 }
    shopping_charge_id    { 1 }
    prefecture_id         { 1 }
    shopping_day_id       { 1 }
    price                 { 300 }
    association :user
    
    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
