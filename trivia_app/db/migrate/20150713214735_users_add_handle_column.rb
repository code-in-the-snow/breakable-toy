class UsersAddHandleColumn < ActiveRecord::Migration
  def change
    add_column :users, :handle, :string, null: false, default: ""
  end
end
