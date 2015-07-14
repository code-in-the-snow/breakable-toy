class DropIndividualAnswers < ActiveRecord::Migration
  def change
    remove_column :questions, :option_a
    remove_column :questions, :option_b
    remove_column :questions, :option_c
    remove_column :questions, :option_d
  end
end
