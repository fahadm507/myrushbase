class MembershipsController < ApplicationController
   def create

    @user = User.find(params[:user_id])
    @group = Group.find(params[:group_id])
    @membership = @group.memberships.build(user_id:@user.id, group_id: @group.id)
    if @membership.save
      redirect_to "/groups/#{@group.id}"
    else
      flash[:notice] = "could not be allowed, try again"
      redirect_to "/groups/#{@group.id}"
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @membership = Membership.find(params[:id])
    @group = Group.find(params[:group_id])
    if @membership.destroy
      redirect_to "/groups/#{@group.id}"
    else
      flash[:notice]= "like could not be deleted"
      redirect_to user_path(@user)
    end
  end
end
