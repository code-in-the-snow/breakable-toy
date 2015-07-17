class DropQuizzes < ActiveRecord::Migration
  def up
    drop_table :quizzes
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
