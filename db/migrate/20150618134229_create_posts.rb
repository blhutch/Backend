class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.integer :user_id
      t.string :img_url
      t.string :answer

      t.timestamps null: false
    end
  end
end
