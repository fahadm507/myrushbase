class GroupfollowersController < ApplicationController
  def create
    authenticate!
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @groupfollower = @group.groupfollowers.build(user_id:@user.id, group_id: @group.id)
    if @groupfollower.save
      redirect_to "/groups/#{@group.id}"
    else
      flash[:notice] = "could not be allowed, try again"
      redirect_to "/groups/#{@group.id}"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @membership = Groupfollower.find(params[:id])
    if @membership.destroy
      redirect_to "/groups/#{@group.id}"
    else
      flash[:notice]= "like could not be deleted"
      redirect_to user_path(@user)
    end
  end
end
