class SessionsController < ApplicationController
  def new

  end

  def create
    #first find the user
    user = User.find_by(username: params[:username])
    authenticated = user.try(:authenticate, params[:password])
    if authenticated
      @user = user
      session[:user_id] = @user.id
      redirect_to user_path(@user.username) # is .username necessary here?
    else
      flash.now[:notice] = "Username and/or password incorrect"
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
