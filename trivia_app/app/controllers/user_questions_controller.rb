require 'byebug'
require 'question_grader'
require 'quiz'

class UserQuestionsController < ApplicationController

  before_action :completed_quiz_check, only: [ :index ]

  def index
    @user_questions = UserQuestion.where(user_id: @user.id).to_a
    @quizzes = []
    while !@user_questions.empty?
      @quizzes << Quiz.new(@user_questions.slice!(0..4))
    end
  end

  def new
      @user = current_user
      @user_question = UserQuestion.new

      random_id = rand(1..Question.count)
      while UserQuestion.where(user_id: @user.id,
                               question_id: random_id,
                               "correct?": true).exists?
        puts random_id
        random_id = rand(Question.count)
      end

      @question = Question.find(random_id)
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

  def completed_quiz_check
    @user = current_user
    user_questions = UserQuestion.where(user_id: @user.id).to_a
    incomplete = user_questions.size % 5
    if incomplete > 0
      to_remove = user_questions.reverse.take(incomplete  )
      to_remove.each do |question|
        question.delete
      end
    end
  end
end
