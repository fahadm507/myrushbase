class GroupsController < ApplicationController

  def create
    user = User.find(params[:user_id])
    group = user.groups.build(group_params)

    if group.save
      redirect_to user_groups_path
    else
      flash.now[:notice] = "Your subject was invalid. Try again!"
      render :'groups/new'
      current_user.groups.delete(group)
      @group = Group.new
      render '/groups/new'
    end
  end

  def index
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def show
    @group = Group.find(params[:id])
    @grouppost = Grouppost.new
    @groupposts = Grouppost.order(created_at: :desc)
  end

  def group_params
    params.require(:group).permit(:name, :goal, :description, :topics)
  end
end
