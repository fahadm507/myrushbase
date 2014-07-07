class CommentsController < ApplicationController

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to dashboard_index_path
    else
      @post.comments.delete(@comment)
      render '/dashboard/index'
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
