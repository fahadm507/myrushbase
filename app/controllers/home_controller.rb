class HomeController < ApplicationController
  def index
    @recent_memebers = User.last(8)
  end
end
