class Post < ActiveRecord::Base
	belongs_to :user
	has_many :guesses
	validates :img_url, :answer, presence: true
end
