# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  layout "user_part"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def var_layouts
    case controller_name
     when "home" 
         "wrapper-in"
     when "participants"
       "wrapper-in-sub-band1"
     else 
       "wrapper-in-sub-band"
    end
  end
  
  def last_album
    @last_album ||= Album.find_or_create("title", "description")
  end
  
  helper_method :last_album, :var_layouts, :current_post
  
end


