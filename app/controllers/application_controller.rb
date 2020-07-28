class ApplicationController < ActionController::Base
  require 'helper_module.rb'
  include HelperModule

  add_flash_types :notice, :alert
end
