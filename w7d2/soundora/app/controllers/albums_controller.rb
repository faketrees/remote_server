class AlbumsController < ApplicationController
    before_action :require_logged_in, except: [:index, :show]

    def index
        user = User.find_by(id: params[:id])
        render band_albums
    end

    def show
        @album = Album.find_by(id: params[:id])
        render :show
    end

    def new
        @band = Band.find(params[:band_id])
        @album = Album.new(band_id: params[:band_id])
        render :new
    end

    def create
      @album = Album.new(album_params)

      if @album.save
        redirect_to album_url(@album)
      else
        @band = @album.band
        flash.now[:errors] = @album.errors.full_messages
        render :new
      end
    end

    def edit
      @album = Album.find(params[:id])
      render :edit
    end

    def update
      @album = Album.find(params[:id])

      if @album.update(album_params)
        redirect_to album_url(@album)
      else
        flash.now[:errors] = @album.errors.full_messages
        render :edit
      end
    end

    def destroy
      @album = Album.find(params[:id])
      @album.destroy
      redirect_to band_url(@album.band_id)
    end


    private

    def band_params
      params.require(:band).permit(:title, :band_id)
    end
end
