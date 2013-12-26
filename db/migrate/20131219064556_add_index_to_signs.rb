class AddIndexToSigns < ActiveRecord::Migration
  def change
    add_index :signs, [:user_id, :good_id], unique: true
  end
end
