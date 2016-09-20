class Api::OrdersController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    if params[:user_id]
      respond_with User.find(params[:user_id]).orders
    else
      respond_with Order.all
    end
  end

  def show
    if params[:user_id]
      respond_with User.find(params[:user_id]).orders.find(params[:id])
    else
      respond_with Order.find(params(:id))
    end
  end

  def create
    @order = Order.new(params.require(:order).permit(:document_name, :finalized))
    @order.user = User.find(params[:user_id])
    if @order.save
      render json: @order, status: 201, location: [:api, @order]
    else
      render json: { errors: @order.errors }, status: 422
      end
  end
end
