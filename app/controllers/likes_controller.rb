class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.build(user_id: current_user.id, post_id: @post.id)
    if @like.save
      respond_to do |format|
        format.html { redirect_to user_path(@post.user) }
        format.js
      end
    else
      flash[:notice] = "un able to save this like"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @like = Like.find(params[:id])
    if @like.destroy
      redirect_to user_path(@post.user)
    else
      flash[:notice]= "like could not be deleted"
      redirect_to users_path
    end
  end
end
