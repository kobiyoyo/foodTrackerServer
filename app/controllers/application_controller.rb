class ApplicationController < ActionController::API
  include Knock::Authenticable
  include AuthFilter
end
