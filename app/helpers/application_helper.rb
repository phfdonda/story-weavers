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

  def vote_unvote_btn(article)
    vote = Vote.find_by(article: article, user: current_user)

    if like
      link_to('Unvote!', article_like_path(id: vote.id, article_id: article.id), method: :delete)
    else
      link_to('Vote!', article_likes_path(article_id: article.id), method: :post)
    end
  end

  def logged_in_as
    if logged_in?
      render 'layouts/welcome_user'
      # link_to 'Edit profile', edit_user_registration_path, class: 'navbar-link'
      link_to 'Log Out', logout_path, method: :delete, class: 'navbar-link'
    else
      link_to 'Register', signup_path, class: 'navbar-link'
      link_to 'Log In', login_path, class: 'navbar-link'
    end
  end

  def display_image(image)
    rails_blob_url(image) if image.attached?
  end
end
