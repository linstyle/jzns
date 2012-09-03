class ApplicationController < ActionController::Base
  protect_from_forgery
  Encoding.default_internal = 'utf-8'
  Encoding.default_external = 'utf-8'
end
