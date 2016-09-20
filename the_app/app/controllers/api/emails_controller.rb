class Api::EmailsController < ApplicationController
  respond_to :json
  skip_before_action :verify_authenticity_token

  def show
    @user = User.find_by(email: params[:id])
    if @user
      respond_with @user
    else
      render json: {info: "Sorry"}, status: 200
    end
  end
end
