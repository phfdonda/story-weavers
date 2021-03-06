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
    @current_user ||= User.find_it(session[:user_id]) if session[:user_id]
  end

  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

  def refresh_matview
    LastArticle.refresh if LastArticle.all.empty?
  end

  def authenticate_user!
    return if logged_in?

    redirect_to login_path, notice: 'You have to be logged in!'
  end

  def make_rows(list)
    row = []
    rows = []
    list.each_with_index do |item, index|
      row << item
      if (index % 4).zero?
        rows << row
        row = []
      elsif index == list.size
        rows << row
      end
    end
    rows
  end
end
