class RenameUserAliasColumn < ActiveRecord::Migration
  def change
    remove_column :users, :alias
  end
end
