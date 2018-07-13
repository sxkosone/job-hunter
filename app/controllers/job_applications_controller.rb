class JobApplicationsController < ApplicationController
  before_action :require_login
  before_action :find_job_application, only: [:show, :edit, :update, :destroy]
  
  def index
    @my_applications = JobApplication.where("user_id = ?", session[:user_id])
  end
  
  def show
    @job = @job_application.job
    @tasks = @job_application.tasks
    @events = @job_application.events.order(:date)
  end

  def create
    job_id = job_application_params(:job_id)[:job_id]
    @job_application = JobApplication.find_or_create_by(
      status: "started", 
      user_id: session[:user_id], 
      job_id: job_id)
    redirect_to application_path(@job_application)
  end

  def edit
  end

  def update
    @job_application.update(job_application_params(:status))
    redirect_to application_path(@job_application)
  end

  def destroy
    #destroy events and tasks of that application
    @job_application.application_task_event_destroyer
    #destroy that application
    @job_application.destroy
    redirect_to applications_path(logged_in_user)
  end

  private
  def find_job_application
    @job_application = JobApplication.find(params[:id])
  end

  def job_application_params(*args)
    params.require(:job_application).permit(*args)
  end
end
