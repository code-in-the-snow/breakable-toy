class AddResponseToUserQuestions < ActiveRecord::Migration
  def change
    add_column :user_questions, :response, :string
  end
end
