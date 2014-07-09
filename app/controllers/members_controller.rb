class MembersController < ApplicationController

  def index
    @members = User.order(created_at: :desc).limit(10)
  end

  def show
    @member = User.find(params[:id])
  end
end
