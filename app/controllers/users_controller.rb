class UsersController < ApplicationController
  before_action :authenticate_with_token!, only: [:index, :delete, :update]

  def user_signup
    passhash = Digest::SHA1.hexdigest(params[:password])
    @user = User.new(username: params[:username], full_name: params[:full_name],
                     email: params[:email], password: passhash, total_points: 0)
    if @user.save
      # render json "register.json.jbuilder", status: :created
      render json: { user: @user.as_json(only: [:id, :username, :full_name,
                     :email, :total_points,:access_token]) },
        status: :created
    else
      render json: { errors: @user.errors.full_messages },
        status: :unprocessable_entity
    end
  end


  def user_signin
    @user = User.find_by(username: params[:username])
    passhash = Digest::SHA1.hexdigest(params[:password])
    if @user && passhash == @user.password
      render json: {user: @user.as_json(only: [:id, :email, :access_token]) },
        status: :created
    else
      render json: { message: "Invalid login or password." },
        status: :unauthenticated
    end
  end


  def delete
    @user = User.find_by(username: params[:username])
    if current_user.access_token == @user.access_token
      @user.destroy
    end
    render json: { message: "Test message" }, status: :no_content
  end 

  def index
    if params[:top] == "true"
      @users = User.order(total_points: :desc).page(params[:page]).per(params[:per]).to_a
    else
      @users = User.page(params[:page]).per(params[:per]).to_a
    end
    
    # json.array! @user{ :username, :full_name, :email, :total_points
    #   }
  end

  #def update
    # if we decide this is needed to update a player profile, I will put it in.
  #end

  #def user_lookup
  #   @user = User.find_by(params[:email])
  #   render json: {user: @user.as_json(only: [:id, :email, :access_token]) },
  #   status: :created
  # end

  

  
end