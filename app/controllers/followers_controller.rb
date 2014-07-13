
class FollowersController < ApplicationController
  def create

    @user = User.find(current_user.id)
    current_user.follow!(@user)
    redirect_to @user
  end

  def destroy
    @user = Follower.find(params[:id]).followed
    current user.unfollow!(@user)
    redirect to @user
  end
end
