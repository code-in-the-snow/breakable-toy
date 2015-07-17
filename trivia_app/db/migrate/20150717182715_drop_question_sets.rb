class DropQuestionSets < ActiveRecord::Migration
  def up
    drop_table :question_sets
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
