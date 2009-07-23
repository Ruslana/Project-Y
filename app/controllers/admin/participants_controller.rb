class Admin::ParticipantsController < ProtectedController
  def new
    @participant = Participant.new
  end
  
  def create    
     @participant = Participant.create(params[:participant])
    if @participant.save
      redirect_to admin_participant_path(@participant)
    else
      render :action => "new"
    end
  end
  
  def edit
    @participant = Participant.find(params[:id])
  end 
  
  def update
     @participant = Participant.find(params[:id])
     if @participant.update_attributes(params[:participant])
       redirect_to admin_participant_path(@participant)
     else
       redirect_to :action => 'edit'
     end
   end
   
  def index
    @participants = Participant.all
  end
  
  def show
    @participant = Participant.find(params[:id]) 
  end
  
  def destroy
    @participant = Participant.find(params[:id])
    @participant.destroy
    redirect_to :action => 'index'
  end
  
end
