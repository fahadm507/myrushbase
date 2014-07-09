class UsersController < ApplicationController

  def index
    @post = Post.new
    @comment= Comment.new
    @like = Like.new
    @point = Point.new

    # 5 most recent of current_user's posts
    # 10 most recent posts of followers
    # @followers_posts = current_user.followers.posts.order(created_at: :desc).limit(10)
  end

end
