class UsersController < ApplicationController
  def index
    @question = Question.new
    @user = User.find(params[:user_id])
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new
    @suggested_users = User.suggested_users(current_user.category)
    @suggested_users.delete(current_user)
    @feed_posts = Post.posts_from_users(current_user).limit(10)
  end

  def search
    if params[:category]
       @search_results = User.users_by_category(params[:search], current_user, params[:category][:id])
       render 'search'
    else
      @search_results = User.search_users(params[:search], current_user)
      render 'search'
    end
  end

  def show
    @feed_posts = Post.posts_from_users(current_user).limit(10)
    if current_user
       @user = current_user
    else
      @user = User.find(params[:id])
    end
    @subject = Subject.new
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


