class JobsController < ApplicationController
  before_action :find_job, only: [:show, :edit, :update, :destroy]
  def index
    #show both form to create new job 
    #and the job feed
    @jobs = Job.all
    #in the future: @jobs = Job.find_by(city: @user.city)
    #pass new job object for the form
    @job = Job.new
  end

  def show
    #after clicking on a job in feed, user can view job details

  end

  def edit
  end

  def update
    @job.update(job_params)
    redirect_to @job
  end

  def create
    #create job AND new application
    @job = Job.create(job_params)
    @job_application = JobApplication.create(percentage: 0, status: "started", job_id: @job.id, user_id: session[:user_id])
    redirect_to @job
  end

  def destroy
    #delete the job
    @job.destroy
    redirect_to jobs_path
  end

  private
  def find_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:position, :description, :posted_date, :company, :city, :url)
  end

end
