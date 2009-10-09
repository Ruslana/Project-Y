class DownloadsController < ApplicationController
  def index
    @album = Album.last
  end
end
