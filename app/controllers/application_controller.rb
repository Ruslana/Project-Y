# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  
  layout "user_part"
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  
  def current_post
    @current_post ||= Post.find_or_create("Пост", "blabla", Date.new)
  end
  
  def var_layouts
    "wrapper-in" if controller_name == "posts"
    #{}"wrapper-in-sub-band" if controller_name == "reviews" || "lyrics" || "albums" || "posts"
    #{}"wrapper-in-sub-band1" if controller_name == "participants"
  end
  
  def last_album
    @last_album ||= Album.find_or_create("title", "description")
  end
  
  helper_method :last_album, :var_layouts, :current_post
  
end


