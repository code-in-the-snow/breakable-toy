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
      @user = current_user
      @user_question = UserQuestion.new
      @question = Question.next
      session[:q] = @question.id
      @answers = @question.answers
      @user_question.response = params[:response]
  end

  def create
    session[:count] -= 1
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

    if session[:count] == 0
      session[:count] = 5
      redirect_to user_path(@user)
    else
      redirect_to :back
    end


 #    def create
 #   @response = current_user.responses.build(params[:response])
 #   if @response.save
 #      respond_to do |format|
 #        format.html { redirect_to new_response_path }
 #        format.js
 #      end
 #   else
 #      render 'new'
 #   end
 # end
  end

  protected
  def user_question_params
    params.require(:user_question).permit(:correct?, :response, :user_id,
                                          :question_id,)
  end
end
