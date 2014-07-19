class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to users_path(@post.user_id)
    else
      current_user.posts.delete(@post)
      @comment = Comment.new
      render '/users/index'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
