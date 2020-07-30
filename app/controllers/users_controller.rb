class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      remember @user
      redirect_to root_path
    else
      respond_to do |f|
        f.html { render :new }
        f.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def current_user
    @current_user ||= User.return_current_user(session[:user_id]) if session[:user_id]
  end
end
