module ApplicationHelper
  require 'helper_module.rb'
  include HelperModule

  def flash_msg
    if notice
      render partial: 'layouts/notice_msg'
    elsif alert
      render partial: 'layouts/alert_msg'
    end
  end

  

  # def logged_in_as
  #   if logged_in?
  #     render welcome_user
  #     link_to 'Edit profile', edit_user_registration_path, class: 'navbar-link'
  #     link_to 'Logout', destroy_user_session_path, method: :delete, class: 'navbar-link'
  #   elsif link_to 'Sign up', new_user_registration_path, class: 'navbar-link'
  #     link_to 'Login', new_user_session_path, class: 'navbar-link'
  #   end
  # end
end
