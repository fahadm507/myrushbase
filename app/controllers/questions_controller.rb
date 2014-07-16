class QuestionsController < ApplicationController
  def index
    @questions = Question.questions_category(current_user.category)
  end
  def edit
    @question = Question.find(params[:id])
  end

  def update
    @question = Question.find(params[:id])
    if @question.update(question_params)
      redirect_to "/questions/#{@question.id}"
    else
      render :'questions/edit'
    end
  end

  def new
    @question = Question.new
  end

  def create
    user = User.find(current_user.id)
    question = user.questions.build(question_params)

    if question.save
      redirect_to '/questions'
    else
      flash.now[:notice] = "Your question was invalid. Try again!"
      render :new
    end
  end

  def question_params
    params.require(:question).permit(:body)
  end

end
