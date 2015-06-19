class AddPotentialPointsToGuesses < ActiveRecord::Migration
  def change
  	add_column :guesses, :potential_points, :integer, :default => 100
  end
end
