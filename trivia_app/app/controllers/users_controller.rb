#require 'byebug'

class UsersController < ApplicationController
  def index
  end

  def show
    @user = User.find(params[:id])
    @quizzes = @user.quizzes
  end

  protected
  def user_params
    params.require(:user).permit(:email, :password, :handle)
  end
end
