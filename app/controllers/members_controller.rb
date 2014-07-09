class MembersController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @members = User.order(created_at: :desc).limit(10)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new
  end
end
