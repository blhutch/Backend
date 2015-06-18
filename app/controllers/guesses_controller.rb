class GuessesController < ApplicationController

	def index
		post = Post.find(params[:post_id])
		@post = post.guess.all

		if @post 
			@post.guesses.each do |guess|
				format json: {
					owner: guess.user.as_json(only: [:username, :full_name, :email, :total_points]),
					post_id: @post.id,
					guess: guess.guess,
					points: guess.points
				}
			end
		else
			render json: { errors: post.errors.full_messages }, status: :bad_request
		end	
	end

	def user
		@post = Post.find(params[:post_id])
		@user = User.find_by(username: params[:username])
		@guesses = @user.guesses.where(post_id: @post.id)
		if @guesses
			@guesses.each do |guess|
				format json: {
					owner: @user.as_json(only: [:username, :full_name, :email, :total_points]),
					post_id: @post.id,
					guess: guess.guess,
					points: guess.points
				}
			end
		else
			render json: { errors: @guesses.errors.full_messages }, status: :bad_request
		end
	end

	def show
		@guess = Guess.find(params[:guess_id])
		@user = User.find(@guess.user_id)
		if @guess
			render json: { 
				owner: @user.as_json(only: [:username, :full_name, :email, :total_points]),
				post_id: @guess.post_id,
				guess: @guess.guess,
				points: @guess.points
			}
		else
			render json: { errors: @guess.errors.full_messages }, status: :bad_request
		end
	end

	def create
		@post = Post.find(params[:post_id])
		@user_guesses = Post.find(params[:post_id]).guesses.where(user_id: current_user.id).count
		points = 0
		if params[:guess] =~ /#{@post.answer}/ 
			points = 100 - @user_guesses * 10
			if points < 0
				points = 0
			end
			points
		end
		@guess = Guess.new(user_id: current_user.id, post_id: params[:post_id], 
											 guess: params[:guess].downcase, points: points)
		if @guess.save
			if @guess.answer == @post.answer
				@post.solution = @guess.id
			end
			render json: { message: "The guess was created and stored successfully." }, status: :created
		else
			render json: { errors: @guess.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@guess = Guess.find(params[:guess_id])
		if @guess.destroy
			render json: { message: "The guess was successfully deleted." }, status: :no_content
		else
			render json: { errors: @guess.errors.full_messages }, status: :bad_request
		end
	end
end