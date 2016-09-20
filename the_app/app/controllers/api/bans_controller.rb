class Api::BansController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with Ban.all
  end

  def show
    @ban = Ban.find_by(email: params[:id])
    if @ban
      respond_with @ban
    else
      render json: {ok: "you are ok"}, status: 201
    end
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
