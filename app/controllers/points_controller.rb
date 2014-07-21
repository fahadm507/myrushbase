class PointsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @point = @user.points.build(user_id: current_user.id)
    if @point.save
      redirect_to user_path(@user)
    else
      flash[:notice] = "un able to save this like"
      redirect_to user_path(@user)
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @point = Point.find(params[:id])
    if @point.destroy
      redirect_to user_path(@user)
    else
      flash[:notice]= "like could not be deleted"
      redirect_to user_path(@user.point)
    end
  end
end
