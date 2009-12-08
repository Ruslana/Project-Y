module ApplicationHelper
  
  def wrapper_css_class
    case controller_name
     when "home" 
       "wrapper-in"
     when "participants", "orders"
       "wrapper-in-sub-band1"
     else 
       "wrapper-in-sub-band"
    end
  end
  
end