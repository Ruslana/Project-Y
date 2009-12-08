class ApplicationController < ActionController::Base
 
  helper :all 
  protect_from_forgery 
  filter_parameter_logging :password
  
  layout "public"
  
  def last_album
    Album.last
  end
  
  helper_method :last_album
  
end


