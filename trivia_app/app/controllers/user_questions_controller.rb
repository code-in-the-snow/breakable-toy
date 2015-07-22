require 'byebug'
require 'question_grader'
require 'quiz.rb'

class UserQuestionsController < ApplicationController
  def index
    @user = current_user
    @user_questions = UserQuestion.where(user_id: @user.id)
    array = @user_questions.to_a
    # byebug

    # @quizzes = []
    # while !array.empty?
    #   @quizzes << Quiz.new(array.to_a.slice!(0..4))
    # end
  end

  def show
  end

  def new
      @user = current_user
      @user_question = UserQuestion.new
      @question = Question.next
      session[:q] = @question.id
      @answers = @question.answers
      @user_question.response = params[:response]
  end

  def create
    session[:count] += 1
    @user = current_user
    @question = Question.find(session[:q])
    @answers = @question.answers
    grader = QuestionGrader.new(@user, @question, params[:response])
    @user_question = UserQuestion.create(correct?: grader.grade,
                                      user_id: @user.id,
                                      question_id: @question.id,
                                      response: params[:response])
    if grader.grade
      flash[:notice] = "Right-o!"
    else
      flash[:notice] = "Wrong!"
    end

    if session[:count] == 6
      session[:count] = 1
      redirect_to user_path(@user)
    else
      redirect_to :back
    end

  end

  protected
  def user_question_params
    params.require(:user_question).permit(:correct?, :response, :user_id,
                                          :question_id,)
  end
end
