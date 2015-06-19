class GuessesController < ApplicationController
	before_action :authenticate_with_token!

	def index
		@post = Post.find(params[:post_id])
		@guesses = @post.guesses.all.to_a
		unless @guesses.is_a? Array
			@guesses = [@guesses]
		end
		if @guesses 
			render :index
		else
			render json: { errors: post.errors.full_messages }, status: :bad_request
		end	
	end

	def user
		@post = Post.find(params[:post_id])
		@user = User.find_by(username: params[:username])
		@guesses = Guess.where("user_id = ? AND post_id = ?", @user.id, @post.id)
		# unless @guesses.is_a? Array
		# 	@guesses = [@guesses]
		# end
		if @guesses
			render :user
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
		complete = false
		potential_points = 90 - @user_guesses * 10
		if params[:guess] == @post.answer
			points = 100 - @user_guesses * 10
			if points < 0
				points = 0
			end
			points
			complete = true
		end
		@guess = Guess.new(user_id: current_user.id, post_id: params[:post_id], 
											 guess: params[:guess].downcase, points: points, 
											 complete: complete, potential_points: potential_points)
		@user = @guess.user
		self.update_points(@user, points)
		if @guess.save
			# if @guess.answer == @post.answer
			# 	@post.solution = @guess.id
			# end
			render json: {  
				id: @guess.id,
				owner: @user.as_json(only: [:username, :full_name, :email, :total_points]),
				post_id: @guess.post_id,
				guess: @guess.guess,
				points: @guess.points,
				potential_points: @guess.potential_points
				}, status: :created
		else
			render json: { errors: @guess.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@guess = Guess.find(params[:guess_id])
		if current_user.access_token == @guess.user.access_token
			if @guess.destroy
				render json: { message: "The guess was successfully deleted." }, status: :no_content
			else
				render json: { errors: @guess.errors.full_messages }, status: :bad_request
			end
		else
			render json: { message: "Unauthorized request."}, status: :unauthorized
		end
	end

	protected

	def update_points(user, points)
		if points > 0
			total_points = user.total_points + points
			user.update(total_points: total_points)
		end
	end
end