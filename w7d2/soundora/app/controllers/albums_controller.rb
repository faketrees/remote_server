class AlbumsController < ApplicationController

    def index
        user = User.find_by(id: params[:id])
        render band_albums
    end

end
