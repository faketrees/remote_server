class SessionsController < ApplicationController
  before_action :require_logged_in, only: [:destroy]
  before_action :require_logged_out, only: [:new, :create]

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:username], params[:user][:password])

    if user
      login!(user)
      redirect_to users_url
    else
      flash.now[:errors] = ["da fuq bro"]
      render :new #redirect_to use flash, render use flash.now
    end
  end

  def destroy
    logout! # calls logout method
    redirect_to new_session_url
end
