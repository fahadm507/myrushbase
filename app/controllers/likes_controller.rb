class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.where(user_id: current_user.id, post_id: @post.id)

    if @like.exists?
      @post.likes.destroy(@like)
      redirect_to dashboard_index_path
    else
      @like = @post.likes.build(user_id: current_user.id, post_id: @post.id)
      @like.save
      redirect_to dashboard_index_path
    end
  end
end
