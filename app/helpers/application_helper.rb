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
    vote = Vote.find_by(article_id: article.id, user_id: current_user.id)

    if vote
      link_to('Unvote', article_votes_path(article_id: article.id), method: :delete)
    else
      link_to('Vote', article_votes_path(article_id: article.id, user_id: current_user.id), method: :post)
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

  def reverse_rows(line_number, html, article)
    html = html
    partial_img = ''
    partial_img += render partial: 'articles/img_box', locals: { article: article.first }
    partial_text = ''
    partial_text += render partial: 'articles/text_box', locals: { article: article.first }
    if line_number.odd?
      html += partial_img
      html += partial_text
    else
      html += partial_text
      html += partial_img
    end
    html
  end

  def make_article_rows(list)
    open_row_set = "<div class='row-set'>"
    open_row = "<div class='row'>"
    open_half_row = "<div class='half-row'>"
    close_tag = '</div>'
    line_number = 0
    html = ''
    html += open_row_set
    list.each_slice(2) do |couple_of_articles|
      line_number += 1
      html += open_row
      couple_of_articles.each do |article|
        html += open_half_row
        reverse_rows(line_number, html, article)
        html += close_tag
      end
      html += close_tag
    end
    html += close_tag
    html.html_safe
  end

  def make_rows_html(list, partial, html_open_tag = '', html_close_tag = '')
    html = ''
    list.each do |item|
      html += html_open_tag
      html += render partial: partial, locals: { item: item }
      html += html_close_tag
    end
    html.html_safe
  end
end
