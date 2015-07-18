#require 'byebug'

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @user_questions = UserQuestion.where(user_id: params[:id])
  end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :handle)
  end
end
