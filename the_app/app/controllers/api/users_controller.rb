class Api::UsersController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with User.all
  end

  def show
    respond_with User.find(params[:id])
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name,
                                                  :email, :address1, :address2,  :city, :date_of_birth, :password))
    if @user.save
      render json: @user, status: 201, location: [:api, @user]
    else
      render json: { errors: @user.errors }, status: 422
      end
  end
end
