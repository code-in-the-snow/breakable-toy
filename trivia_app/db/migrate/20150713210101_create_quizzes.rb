class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.integer :count_questions_asked, default: 0
      t.integer :count_right_answers, default: 0
      t.integer :user_id, null: false

      t.timestamps null:false
    end
  end
end
