class Api::PricesController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with Product.find(params[:product_id]).prices
  end

  def show
    respond_with Product.find(params[:product_id]).prices.find(params[:id])
  end

  def create
    @price = Price.new(params.require(:price).permit(:price_pln))
    @price.product = Product.find(params[:product_id])
    if @price.save
      render json: @price, status: 201
    else
      render json: { errors: @price.errors }, status: 422
      end
  end

end
