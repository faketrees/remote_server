class TracksController < ApplicationController

    def index
        user = User.find_by(id: params[:id])
        render band_tracks
    end
end
