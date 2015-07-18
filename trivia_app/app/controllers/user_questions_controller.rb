class UserQuestionsController < ApplicationController
  def index
    @user_questions = UserQuestion.all
  end

  def show
  end

  def new
    # @user = current_user
    @user = User.find(params[:user_id])
    @question = Question.next
    @answers = @question.answers

    @user_question = UserQuestion.new
  end

  def create
    @user = User.find(params[:user_id])
    @question = Question.next
    @user_question = UserQuestion.new(user_question_params)
    @user_question.user = @user
    @user_question.question = @question

    if @user_question.save
      redirect_to new_user_user_question_path(@user)
    else
      render 'user_questions/new.html.erb'
    end

  end

  protected
  def user_question_params
    params.require(:user_question).permit(:correct?, :user_id,
   :question_id,)
  end
end

# if params[:category_id]
#       @category = Category.find(params[:category_id])
#       @kind = " (#{@category.name})"
#       @drinks = Drink.where(category_id: params[:category_id])
#     else
#       @kind = " "
#       @drinks = Drink.all
#     end
