class UsersController < ApplicationController
  def index
    @users = User.last(10).reverse
  end
end
