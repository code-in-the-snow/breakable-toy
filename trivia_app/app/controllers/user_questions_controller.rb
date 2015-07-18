class UserQuestionsController < ApplicationController
  def index
    @user_questions = UserQuestion.all
  end

  def show
  end

  def new
  end

  def create
  end

  # protected
  # def user_question_params
  #   params.require(:user_question).permit(:correct?, :user_id,
  #  :question_id,)
  # end
end

if params[:category_id]
      @category = Category.find(params[:category_id])
      @kind = " (#{@category.name})"
      @drinks = Drink.where(category_id: params[:category_id])
    else
      @kind = " "
      @drinks = Drink.all
    end
