class UsersController < ApplicationController
before_action :authenticate, only: [:show]

  def show
    @user = User.find_by_id(session[:user_id])
  end

  def new
    redirect_to '/signup', notice: "You're already logged in" if logged_in?
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/', notice: "Successfully signed up!"
    else
      redirect_to '/signup', notice: "An error prevented sign up: #{@user.errors.full_messages.join('. ')}"
    end
  end


  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
