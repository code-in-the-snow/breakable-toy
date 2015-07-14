class AddColumnOptionsArray < ActiveRecord::Migration
  def change
    add_column :questions, :options, :string, array: true, null: false
  end
end
