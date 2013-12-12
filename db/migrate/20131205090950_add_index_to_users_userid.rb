class AddIndexToUsersUserid < ActiveRecord::Migration
  def change
    add_index :users, :userid, unique: true
  end
end
