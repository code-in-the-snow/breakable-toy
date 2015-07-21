require 'pry'
require 'byebug'
require 'question_grader'

class UserQuestionsController < ApplicationController
  def index
    @user = current_user
    @user_questions = UserQuestion.where(user_id: params[:id])
  end

  def show
  end

  def new
      @user_question = UserQuestion.new
      @user_question.response = params[:response]
      @user = current_user
      @question = Question.next
      session[:q] = @question.id
      @answers = @question.answers
  end

  def create
    @user = current_user
    @question = Question.find(session[:q])
    @answers = @question.answers
    grader = QuestionGrader.new(@user, @question, params[:response])
    @user_question = UserQuestion.new(correct?: grader.grade,
                                      user_id: @user.id,
                                      question_id: @question.id,
                                      response: params[:response])
    if grader.grade
      flash[:notice] = "Right-o!"
    else
      flash[:notice] = "Wrong!"
    end

    if @user_question.save
      redirect_to new_user_user_question_path(@user)
    else
      redirect_to '/'
    end
  end

  protected
  def user_question_params
    params.require(:user_question).permit(:correct?, :response, :user_id,
                                          :question_id,)
  end
end
