class UsersController < ApplicationController
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


  def user_lookup
    @user = User.find_by(params[:email])
    render json: {user: @user.as_json(only: [:id, :email, :access_token]) },
    status: :created
  end

  #def delete
    #if we decide this is needed I will put it in.
  #end

  #def update
    #if we decide this is needed to update a player profile, I will put it in.
  #end
end