class LyricsController < ApplicationController
  def show
     @lyric = Lyric.find(params[:id])
   end

   def index
     @lyrics = Lyric.all(:limit => 10, :order => 'created_at DESC')
     @lyrics = Lyric.paginate :page => params[:page], :per_page => 3
   end
end
