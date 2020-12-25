require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品出品機能' do
    context '商品出品ができる場合' do
      it 'image,name,description,category,product_condition,shopping_charge,prefecture,shopping_day,price,userが存在すれば保存できる' do
        expect(@product).to be_valid
      end
    end

    context '商品出品ができない場合' do
      it 'imageが空だと保存できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end
      it 'nameが空だと保存できない' do
        @product.name = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと保存できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'categoryを選択していないと保存できない' do
        @product.category_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'product_conditionを選択していないと保存できない' do
        @product.product_condition_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Product condition can't be blank")
      end
      it 'shopping_chargeを選択していないと保存できない' do
        @product.shopping_charge_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping charge can't be blank")
      end
      it 'prefectureを選択していないと保存できない' do
        @product.prefecture_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shopping_dayを選択していないと保存できない' do
        @product.shopping_day_id = 0
        @product.valid?
        expect(@product.errors.full_messages).to include("Shopping day can't be blank")
      end
      it 'priceが空だと保存できない' do
        @product.price = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが300以下だと保存できない' do
        @product.price = 200
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be greater than or equal to 300')
      end
      it 'priceが9,999,999以上だと保存できない' do
        @product.price = 10_000_000
        @product.valid?
        expect(@product.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end
      it 'priceが半角数字でないと保存できない' do
        @product.price = '５００'
        @product.valid?
        expect(@product.errors.full_messages).to include('Price is not a number')
      end
      it 'userと紐づいていないと保存できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('User must exist')
      end
    end
  end
end
