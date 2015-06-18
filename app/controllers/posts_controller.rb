class PostsController < ApplicationController

	def index
		@posts = Post.all
		if @posts

			
			# @posts.each do |post|
			# 	render json: { 
			# 		id: post.id
			# 		owner: post.user.as_json(only: [:username, :full_name, :email, :total_points]),
			# 		img_url: post.img_url,
			# 		answer: post.answer
			# 	}, status: :ok
			# end
		else
			render json: { message: "There are no posts in the system." }, status: :no_content
		end
	end

	def incomplete
		@user = current_user
		@posts = Post.all
		@complete = self.complete(@user)
		if params[:incomplete] == 'true'
			@posts = Post.all.where.not("id = ?", @complete)
			if @posts
				@posts.each do |post|
					render json: { 
						id: post.id
						owner: post.user.as_json(only: [:username, :full_name, :email, :total_points]),
						img_url: post.img_url,
						answer: post.answer
						}, status: :ok
				end
			else
				render json: { error: @posts.errors.full_messages }, status: :bad_request
			end
		else
			if @posts
				@posts.each do |post|
					render json: { 
						id: post.id
						owner: post.user.as_json(only: [:username, :full_name, :email, :total_points]),
						img_url: post.img_url,
						answer: post.answer
						}, status: :ok
				end
			else
				render json: { message: "There are no posts in the system." }, status: :no_content
			end			
		end
	end

	def show
		@post = Post.find(params[:post_id])
		if @post
			render json: { 
				id: @post.id
				owner: @post.user.as_json(only: [:username, :full_name, :email, :total_points]),
				img_url: @post.img_url,
				answer: @post.answer
				}, status: :ok
		else
			render json: { error: @post.errors.full_messages }, status: :bad_request
		end
	end

	def user
		@posts = Post.find_by(user_id: params[:user_id])
		if @posts
			@posts.each do |post|
				render json: { 
					id: post.id
					owner: post.user.as_json(only: [:username, :full_name, :email, :total_points]),
					img_url: post.img_url,
					answer: post.answer
					}, status: :ok
			end
		else
			render json: { error: @posts.errors.full_messages }, status: :bad_request
		end
	end

	def create
		@post = Post.new(user_id: current_user.id, img_url: params[:img_url], 
										 answer: params[:answer])
		if @post.save
			render json: { message: "The post was created and stored successfully." }, status: :created
		else
			render json: { errors: @post.errors.full_messages }, status: :unprocessable_entity
		end
	end

	def destroy
		@post = Post.find(params[:post_id])
		if @post.destroy
			render json: { message: "The post was successfully deleted." }, status: :no_content
		else
			render json: { errors: @post.errors.full_messages }, status: :bad_request
		end
	end

	protected

	def complete(user)
		complete = []
		user_completed = user.guesses.where("points > ?", 0)
		user_completed.each do |guess|
			complete << post.post_id
		end
		complete
	end

end