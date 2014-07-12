class UsersController < ApplicationController
  def index
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new
    @members = User.order(created_at: :desc).limit(10)
  end
end
