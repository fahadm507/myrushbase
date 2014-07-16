class UsersController < ApplicationController
  def index
    @questions = Question.find_questions_and_answers(current_user.category)
    @question = Question.new
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new

    @suggested_users = User.suggested_users(current_user.category)
    @feed_posts = Post.posts_from_users(current_user).limit(10)
  end

  def search
    if params[:search]
      @search_results = User.search_users(params[:search], current_user, params[:category][:id])
    end
    # search for users
    # will render search.html.erb
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


