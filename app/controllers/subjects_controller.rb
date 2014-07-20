class SubjectsController < ApplicationController
  def create
    user = User.find(current_user.id)
    subject = user.subjects.build(subject_params)

    if subject.save
      redirect_to user_path(current_user.id)
    else
      flash.now[:notice] = "Your subject was invalid. Try again!"
      render :'subjects/new'
      current_user.subjects.delete(@post)
      @subject = Subject.new
      render '/subjects/new'
    end
  end

  def new
    @subject = Subject.new
  end

  def destroy
    @subject = Subject.find(params[:id])

    if current_user == @subject.user
      @subject.destroy
      redirect_to new_user_subject_path(current_user)
    end
  end

  def subject_params
    params.require(:subject).permit(:name)
  end

end
