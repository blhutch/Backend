class AddHintToPosts < ActiveRecord::Migration
  def change
  	add_column :posts, :hint, :string, default: ""
  end
end
