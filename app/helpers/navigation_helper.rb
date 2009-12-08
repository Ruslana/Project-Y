module NavigationHelper
  
  def select_link_to(name, url)
    current_page? :css
  end
  
end