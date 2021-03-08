class UsersController < ApplicationController

  before_action :require_logged_out, only: [:new, :create]
  before_action :require_logged_in, only: [:show, :edit, :destroy, :index]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_url(@user)
    else
      render :new
    end
  end

  def show
    @user = User.find_by(id: params[:id])
    render :show
  end

  def destroy
    @user = User.find_by(id: params[:id])
    @user.destroy
    redirect_to new_session_url
  end

  def edit
    @user = User.find_by(id: params[:id])
    render :edit
  end

  def index
    @users = User.all
    render :index
  end

  def update
    # PATCH /users/:id
    user = User.find_by(id: params[:id])

    if user
      if user.update(user_params)
        render json: user
      else
        render json: user.errors.full_messages, status: 422
      end
    else
      flash.now[:errors] = "User not found"
      render :new_session_url
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end

end
