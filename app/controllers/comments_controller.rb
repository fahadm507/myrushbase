class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to user_path(@post.user_id)
    else
      redirect_to user_path(@post.user_id)
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
