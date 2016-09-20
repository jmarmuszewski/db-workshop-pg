class Api::ProductsController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index1
    Product.all.order(id: :desc).select(:id, :name)
  end

  def index2
    @products = []
    Product.all.includes(:prices).select(:id, :available).each do |p|
      @products << p.attributes.merge({:price => p.prices.last})
    end
    @products
  end

  def index3

  end

  def index
    @products = index2

    respond_with @products
    #respond_with Product.all.limit(100)
    #respond_with Product.includes(:prices)


  end

  def show
    @product = Product.find(params[:id])
    @price = @product.prices.last.price_pln if @product.prices.last
    render json: @product.attributes.merge({ price: @price})
  end

  def create
    @product = Product.new(params.require(:product).permit(:name, :description, :available))
    if @product.save
      render json: @product, status: 201, location: [:api, @product]
    else
      render json: { errors: @product.errors }, status: 422
      end
  end
end
