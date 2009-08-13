module ParticipantsHelper
  
  def render_partial_for_participant(name)
    case name
  	when "aidan"
  	  render :partial => 'aidan'
  	when "barry"
  		render :partial => 'barry'
  	when "sharky"
  	  render :partial => 'sharky'
  	when "nicky"
  	  render :partial => 'nicky'
  	end
  end
  
end