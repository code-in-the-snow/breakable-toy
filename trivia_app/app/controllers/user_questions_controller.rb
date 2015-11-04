require 'byebug'
require 'question_grader'
require 'quiz.rb'

class UserQuestionsController < ApplicationController
  def index
    @user = current_user
    # select completed questions for current user from table
    @user_questions = UserQuestion.where(user_id: @user.id)
    array = @user_questions.to_a  # pg object to ruby array

    full_quiz = array.size - (array.size % 5) # check for stray questions
    # drop questions after last full quiz grouping of five
    array = array.take(full_quiz)

    @quizzes = []
    while !array.empty?
      @quizzes << Quiz.new(array.slice!(0..4))
    end
  end

  def new
      @user = current_user
      @user_question = UserQuestion.new

      check_id = rand(1..Question.count)
      while UserQuestion.where(user_id: check_id).exists?
        check_id = rand(1..Question.count)
      end
      @question = Question.find(check_id)

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
    @user_question = UserQuestion.create(grader.attributes)

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
