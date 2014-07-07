class DashboardController < ApplicationController
  def index
    @post = Post.new
  end
end
