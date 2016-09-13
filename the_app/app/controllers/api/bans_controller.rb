class Api::BansController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with Ban.all
  end

  def show
    respond_with Ban.find(params[:id])
  end

  def create
    @ban = Ban.new(params.require(:ban).permit(:email, :reason))
    if @ban.save
      render json: @ban, status: 201, location: [:api, @ban]
    else
      render json: { errors: @ban.errors }, status: 422
      end
  end
end
