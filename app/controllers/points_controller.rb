class PointsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @point = @user.points.build(user_id: current_user.id)
    if @point.save
      redirect_to users_path
    else
      flash[:notice] = "un able to save this like"
      redirect_to users_path
    end
  end

  def destroy
    @point = Point.find(params[:id])
    if @point.destroy
      redirect_to users_path
    else
      flash[:notice]= "like could not be deleted"
      redirect_to users_path
    end
  end
end
