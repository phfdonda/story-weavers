class SessionsController < ApplicationController
  before_action :authenticate_user!, except: %i[new create]

  def new
    redirect_to root_path unless current_user.nil?
  end

  def create
    user = User.find_it_by_name(params[:session][:name])
    if user.nil?
      redirect_to login_path, alert: 'What kind of name is that?' unless params[:session][:name].split.empty?
      redirect_to login_path, alert: 'Don\'t you have a name, dear?' if params[:session][:name].split.empty?
    else
      log_in user
      remember user
      redirect_to root_path, notice: 'Welcome, dear writer!'
    end
  end

  def destroy
    log_out
    redirect_to(root_path, notice: 'Buh-bye! Safe travels!')
  end
end
