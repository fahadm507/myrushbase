
class RelationshipsController < ApplicationController
  before_action :sign_in_user
  def create
    @user = User.find(params[:relationship][:followed_id])
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Follower.find(params[:id]).followed
    current user.unfollow!(@user)
    redirect to @user
  end
end
