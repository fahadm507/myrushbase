class HomeController < ApplicationController
  def index
    @recent_memebers = User.last(5)
  end
end
