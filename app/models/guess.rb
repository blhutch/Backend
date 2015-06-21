class Guess < ActiveRecord::Base
	belongs_to :user
	belongs_to :post
	validates :guess, presence: true, length: { maximum: 10 }
end
