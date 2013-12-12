class CreateSigns < ActiveRecord::Migration
  def change
    create_table :signs do |t|
      t.integer :user_id
      t.integer :good_id
      t.timestamps
    end
  end
end
