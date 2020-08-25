class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def index
    @users = User.all
  end

  def show
    @user = User.find_it(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      redirect_to root_path, notice: 'Yay! You are one of us now! A big welcome!!!'
    else
      render :new, alert: 'Oops, something went wrong...'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
