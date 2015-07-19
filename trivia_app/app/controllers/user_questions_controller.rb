class UserQuestionsController < ApplicationController
  def index
    @user_questions = UserQuestion.all
  end

  def show
  end

  def new
    # @user = current_user
    sessions[:count] = 0
    sessions[:correct] = 0
    while sessions[:count] = 0
      @user = User.find(params[:user_id])
      @question = Question.next
      @answers = @question.answers

      @user_question = UserQuestion.new
      sessions[:count] += 1
  end
  end

  def create
    @user = User.find(params[:user_id])
    @question = Question.next
    @user_question.user = @user
    @user_question.question = @question
    if params[:input] == @question.answer
      @user_question.correct?
    else
      !@user_question.correct?
    end
    @user_question = UserQuestion.new(user_question_params)

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
