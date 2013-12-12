class ChangeColumn < ActiveRecord::Migration
  def change
    change_column :goods, :content, :text, limit: nil
  end
end
