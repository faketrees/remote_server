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
    bands.all
    render :index
  end

  def show
    @band = Band.find_by(params[:id])
    render :show
  end

  def update
  end

  def destroy
  end

  def edit
  end

  private
  def band_params
    params.require(:band).permit(:name)
  end
end
