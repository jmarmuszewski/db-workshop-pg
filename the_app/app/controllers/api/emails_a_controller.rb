class Api::EmailsAController < ApplicationController
  respond_to :json
  skip_before_filter :verify_authenticity_token

  def index
    @response = User.where.not(:email => Ban.select(:email)).select(:email)
    respond_with @response[1..10]
  end
end

#EXPLAIN SELECT "users"."email" FROM "users" WHERE ("users"."email" NOT IN (SELECT "bans"."email" FROM "bans"));
