class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]

  def index
    # @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:name, :description, :category_id, :product_condition_id, :shopping_charge_id,
                                    :prefecture_id, :shopping_day_id, :price, :image).merge(user_id: current_user.id)
  end
end
