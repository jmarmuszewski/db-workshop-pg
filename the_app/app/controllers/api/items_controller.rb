class Api::ItemsController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token


  def create
    @order = Order.find(params[:order_id])
    if params[:price]
      @price = Price.find(params[:price])
    else
      @price = Product.find(prams[:product]).prices.last
    end
    @item = OrderList.new(params.require(:order_list).permit(:quantity, :discount))
    @item.price = @price
    @item.order = @order

    if @item.save
      render json: @item, status: 201
    else
      render json: { errors: @item.errors }, status: 422
      end
  end


end
