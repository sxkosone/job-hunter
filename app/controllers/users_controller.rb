class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :profession, :city, :password, :password_confirmation))
    if @user.valid?
      @user.save
      #redirect to their dashboard or user show page
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @user.update(user_params(:name, :username, :profession, :city))
    redirect_to user_path(@user.username)
  end

  def show

  end

  def destroy
  end

  private

  def find_user
    @user = User.find_by(username: params[:username])
  end

  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
