class ParticipantsController < ApplicationController
  layout "band3"
  def show
    @participant = Participant.find(params[:id]) 
    
  end
end
