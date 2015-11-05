require 'byebug'
require 'question_grader'
require 'quiz.rb'

class UserQuestionsController < ApplicationController

  before_action :completed_quiz_check, only: [ :index, :destroy ]

  def index
    user_questions = UserQuestion.where(user_id: @user.id).to_a
    @quizzes = []
    while !user_questions.empty?
      @quizzes << Quiz.new(user_questions.slice!(0..4))
    end
  end

  def new
      @user = current_user
      @user_question = UserQuestion.new

      # pick a random id from all ids in questions table
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

  def destroy
    @to_remove.each do |item|
      item.destroy
    end
    render :index
  end

  protected
  def user_question_params
    params.require(:user_question).permit(:correct?, :response, :user_id,
                                          :question_id,)
  end

  def completed_quiz_check
    @user = current_user
    user_questions = UserQuestion.where(user_id: @user.id).to_a
    inc = user_questions.size % 5
    if inc > 0
      @to_remove = user_questions.reverse.take(inc)
      redirect destroy
    end
  end
end
