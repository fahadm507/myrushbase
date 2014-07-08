class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id, post_id: @post.id)
    if @like.save
      redirect_to users_path
    else
      flash[:notice] = "un able to save this like"
      redirect_to users_path
    end
  end

  def destroy
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to users_path
    else
      flash[:notice]= "like could not be deleted"
      redirect_to users_path
    end
  end
end
