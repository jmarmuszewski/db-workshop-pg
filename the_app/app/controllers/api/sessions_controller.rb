class Api::SessionsController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    respond_with User.find(params[:user_id]).sessions
  end

  def show
    if params[:user_id]
      respond_with User.find(params[:user_id]).sessions.find(params[:id])
    else
      @session = Session.find_by(token: params[:id])
      if @session
        respond_with @session.user
      else
        render json: {info: "Sorry"}, status: 200
      end
    end
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
