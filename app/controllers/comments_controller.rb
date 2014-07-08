class CommentsController < ApplicationController

  def create
    @post = current_user.posts.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to users_path
    else
      @post.comments.delete(@comment)
      render '/users/index'
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
