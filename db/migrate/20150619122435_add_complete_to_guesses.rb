class AddCompleteToGuesses < ActiveRecord::Migration
  def change
  	add_column :guesses, :complete, :boolean, :default => false
  end
end
