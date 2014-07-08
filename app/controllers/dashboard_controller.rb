class DashboardController < ApplicationController
  def index
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
  end
end
