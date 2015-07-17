class QuestionsController < ApplicationController
  def index
  end

  def show
    @question = Question.first
    @user = User.find(params[:id])
    @quizzes = @user.quizzes
  end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :handle)
  end
end
