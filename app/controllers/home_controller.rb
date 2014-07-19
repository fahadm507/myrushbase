class HomeController < ApplicationController
  def index
    @recent_memebers = User.last(6)
  end
end
