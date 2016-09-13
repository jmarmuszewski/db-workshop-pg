class Api::SessionsController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with User.find(params[:user_id]).sessions
  end

  def show
    respond_with User.find(params[:user_id]).sessions.find(params[:id])
  end

  def create
    @session = Session.new(params.require(:session).permit(:token))
    @session.user = User.find(params[:user_id])
    if @session.save
      render json: @session, status: 201
    else
      render json: { errors: @session.errors }, status: 422
      end
  end

  def destroy
    @session = User.find(params[:user_id]).sessions.find(params[:id])
    if @session.destroy
      render json: @session, status: 201
    else
      render json: { errors: @session.errors }, status: 422
      end
  end
end
