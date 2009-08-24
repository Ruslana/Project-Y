class ProtectedController < ApplicationController
  
  layout "admin_part"
  before_filter :authorize
  
  filter_parameter_logging :password, :password_confirmation

  protected 

  def authorize 
    unless User.find_by_id(session[:user_id])
       flash[:notice] = "Please log in" 
       redirect_to new_session_path
    end 
  end
   
end
