class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username
      t.string :full_name
      t.string :email
      t.string :password
      t.integer :total_points
      t.string :access_token

      t.timestamps null: false
    end
  end
end
