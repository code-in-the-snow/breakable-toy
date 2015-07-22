class HomesController < ApplicationController
  def index
    session[:count] = 1
    if current_user
      redirect_to user_user_questions_path(current_user)
    end
  end
end
