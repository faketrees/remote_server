class BandsController < ApplicationController

  def new
    render :new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      redirect_to :new
    end
  end

  def index
    @band = Band.all
    render :index
  end

  def show
    @band = Band.find_by(id: params[:id])
    render :show
  end

  def update
    @band = Band.find_by(id: params[:id])
    if @band.update
      redirect_to band_url(@band)
    else
      flash.now[:errors] = "Some error message here, IDK man I am just a message"
      render :edit
    end
  end

  def destroy
    @band = Band.find_by(id: params[:id])
    @band.destroy
    redirect_to bands_url
  end

  def edit
    @band = Band.find_by(id: params[:id])
    render :edit
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
