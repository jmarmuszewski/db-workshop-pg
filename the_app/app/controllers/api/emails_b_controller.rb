class Api::EmailsBController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    @response = User.joins("LEFT JOIN bans on users.email = bans.email").where("bans.email is NULL").select(:email)
    respond_with @response[1..10]
  end
end

#EXPLAIN SELECT "users"."email" FROM "users" LEFT JOIN bans on users.email = bans.email WHERE (bans.email is NULL);
