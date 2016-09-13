class BansController < ApplicationController
  def index
    @bans = Ban.all
  end
end
