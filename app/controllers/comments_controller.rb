class CommentsController < ApplicationController

  def create
    debugger
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    respond_to do |format|
      if @comment.save
        format.html {redirect_to user_path(@post)}
        format.js {}
        format.json { render json: @comment, status: 200 }
      else
        format.html {render user_path(@post.user_id)}
        format.json { render json: { errors: @comment.errors }, status: :unprocessable_entity }
      end
    end
  end

  def comment_params
    params.require(:comment).permit(:description)
  end
end
