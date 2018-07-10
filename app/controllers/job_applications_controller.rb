class JobApplicationsController < ApplicationController

  def index
    @my_applications = JobApplication.where("user_id = ?", session[:user_id])
  end
  
  def show
    @job_application = JobApplication.find(params[:id])
    @job = @job_application.job
  end

  def create
    job_id = job_application_params(:job_id)[:job_id]
    @job_application = JobApplication.create(
      percentage: 0, 
      status: "started", 
      user_id: session[:user_id], 
      job_id: job_id)
    redirect_to application_path(@job_application)
  end

  def edit
  end

  def update
    @job_application = JobApplication.find(params[:id])
    @job_application.update(job_application_params(:status))
    redirect_to application_path(@job_application)
  end

  private
  def job_application_params(*args)
    params.require(:job_application).permit(*args)
  end
end
