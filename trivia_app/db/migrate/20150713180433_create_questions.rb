class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :body, null: false
      t.string :answer, null: false
      t.string :option_a, null: false
      t.string :option_b, null: false
      t.string :option_c, null: false
      t.string :option_d, null: false
    end
  end
end
