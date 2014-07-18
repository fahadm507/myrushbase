class HomeController < ApplicationController
  def index
    @recent_memebers = User.last(6)
    if user_signed_in?
      redirect_to controller: 'users', action: 'index'
    end
  end
end
