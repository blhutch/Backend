class PostsController < ApplicationController
	before_action :authenticate_with_token!

	def index
		@posts = Post.page(params[:page]).per(params[:per]).to_a
		if @posts
			render 'index.json.jbuilder', status: :ok
		else
			render json: { message: "There are no posts in the system." }, status: :no_content
		end
	end

	def incomplete
		@user = current_user
		@complete = self.complete(@user)
		@posts = Post.where.not("id = ?", @complete).page(params[:page]).per(params[:per]).to_a
		if @posts
			render :incomplete
		else
			render json: { error: @posts.errors.full_messages }, status: :bad_request
		end
	end

	def show
		@post = Post.find(params[:post_id])
		@user = @post.user
		if @post
			render json: { 
				id: @post.id,
				owner: @user.as_json(only: [:username, :full_name, :email, :total_points]),
				img_url: @post.img_url,
				answer: @post.answer,
				hint: @post.hint
				}, status: :ok
		else
			render json: { error: @post.errors.full_messages }, status: :bad_request
		end
	end

	def user
		user = User.find_by(username: params[:username])
		@posts = Post.where(user_id: user.id).page(params[:page]).per(params[:per]).to_a
		if @posts
			render :user
		else
			render json: { error: @posts.errors.full_messages }, status: :bad_request
		end
	end

	def create
		if params[:hint].blank?
			hint = ""
		else
			hint = params[:hint]
		end
		@post = Post.new(user_id: current_user.id, img_url: params[:img_url], 
										 answer: params[:answer], hint: hint)
		@user = @post.user
		if @post.save
			render json: { 
				id: @post.id,
				owner: @user.as_json(only: [:username, :full_name, :email, :total_points]),
				img_url: @post.img_url,
				answer: @post.answer,
				hint: @post.hint
			}, status: :created
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
		user_completed = user.guesses.where(complete: true)
		user_completed.each do |guess|
			complete << guess.post_id
		end
		if complete.empty?
			complete << 0
		end
		complete = complete.uniq
	end

end