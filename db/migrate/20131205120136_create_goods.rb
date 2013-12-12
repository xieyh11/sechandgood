class CreateGoods < ActiveRecord::Migration
  def change
    create_table :goods do |t|
      t.string :title
      t.string :content
      t.integer :user_id
      t.integer :category_id
      t.timestamps
    end
    add_index :goods, [:user_id, :created_at]
  end
end
