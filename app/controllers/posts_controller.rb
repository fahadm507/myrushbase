class PostsController < ApplicationController

  def create
    @post = current_user.posts.build(post_params)
    if @post.save
      redirect_to user_path(@post.user)
    else
      current_user.posts.delete(@post)
      @comment = Comment.new
      render 'users/post_form'
    end
  end

  private

  def post_params
    params.require(:post).permit(:body)
  end
end
