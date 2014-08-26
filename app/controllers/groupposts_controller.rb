class GrouppostsController < ApplicationController
  def index
    @groupposts = Grouppost.order(created_at: :desc)
  end

  def edit
    @grouppost = Grouppost.find(params[:id])
  end

  def update
    @grouppost = Grouppost.find(params[:id])
    if @grouppost.update(grouppost_params)
      redirect_to group_path(@grouppost.group)
    else
      render :'groupposts/edit'
    end
  end

  def new
    @grouppost = Grouppost.new
  end

  def create
    group = Group.find(params[:group_id])
    @grouppost = Grouppost.new(grouppost_params)
    @grouppost.user_id = current_user.id
    @grouppost.group_id = group.id

    if @grouppost.save
      redirect_to user_groups_path(group.id)
    else
      flash.now[:notice] = "Your question was invalid. Try again!"
      render :new
    end
  end

  def grouppost_params
    params.require(:grouppost).permit(:body)
  end

end
