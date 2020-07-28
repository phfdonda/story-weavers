module HelperModule
  def logged_in?
    !current_user.nil?
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def remember(user)
    cookies.permanent.signed[:user_id] = user.id
  end

  def current_user
    @current_user ||= User.return_current_user(session[:user_id]) if session[:user_id]
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def creator(event)
    User.find_it(event.creator_id)
  end
end
