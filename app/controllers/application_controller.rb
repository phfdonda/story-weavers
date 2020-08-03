class ApplicationController < ActionController::Base
  require 'helper_module.rb'
  include HelperModule

  add_flash_types :notice, :alert

  @article_published = 'Let the world be amazed! Your article was published!'
end
