class ParticipantsController < ApplicationController
  
  def show
    @participant = Participant.find(params[:id]) 
  end
end
