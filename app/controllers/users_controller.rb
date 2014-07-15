class UsersController < ApplicationController
  def index
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new
    @users = User.order(created_at: :desc).limit(10)
    @feed_posts = Post.posts_from_users(current_user)
  end

  def show
    @user = User.find(params[:id])
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new

  end

  def following
    @title = "Following"
    @user = User.find(params[:id])
    @users = @user.followed_users.all
    render 'show_follow'
  end

  def followers
    @title = "Followers"
    @user = User.find(params[:id])
    @users = @user.followers
    render 'show_follow'
  end
end


