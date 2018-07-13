class UsersController < ApplicationController
  before_action :require_login
  before_action :find_user, only: [:show, :edit, :update, :destroy]
  skip_before_action :require_login, only: [:new, :create]

  helper_method :applications_by_status
  helper_method :past_events

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params(:name, :username, :profession, :city, :password, :password_confirmation))
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      #redirect to their dashboard or user show page
      flash[:welcome] = "Welcome to the JOBbuddy app! This is the place to organize your job hunt. \nYou can now browse jobs in your city, click to add them to your list of applications, and add important tasks and events to each application."
      redirect_to user_path(@user.username)
    else
      render :new
    end
  end

  def edit
  end

  def update
    #ADD USER VALIDATION HERE TO CHECK THAT NO ONE ADDS SOMEONE ELSES USERNAME
    if @user.update(user_params(:name, :username, :profession, :city))
      render :edit
    else
      flash.now[:notice] = "Invalid information - could not update your profile"
      render :edit
    end
  end

  def show
    @tasks = @user.tasks
    @my_applications = @user.job_applications.order(updated_at: :desc).limit(5)
    @general_tasks = @tasks.select{|task| task.job_application_id == nil}
    @events = @user.events.where('date > ?',DateTime.now).order(:date)
  end

  def destroy
  end

  private

  def find_user
    @user = User.find_by(username: params[:username])
    if @user.nil?
      flash[:notice] = "Sorry, incorrect URL"
      redirect_to user_path(logged_in_user)
    elsif @user.id!=session[:user_id]
      flash[:notice] = "You cannot access this page"
      redirect_to user_path(logged_in_user)
    end
  end


  def user_params(*args)
    params.require(:user).permit(*args)
  end
end
