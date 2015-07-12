class AddAliasToUser < ActiveRecord::Migration
  def change
    add_column :users, :alias, :string, null: false, default: ""
  end
end
