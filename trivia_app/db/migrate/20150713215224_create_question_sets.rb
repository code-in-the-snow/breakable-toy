class CreateQuestionSets < ActiveRecord::Migration
  def change
    create_table :question_sets do |t|
      t.integer :quiz_id, null: false
      t.integer :question_id, null: false
    end
  end
end
