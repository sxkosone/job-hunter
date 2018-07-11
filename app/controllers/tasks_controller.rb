class TasksController < ApplicationController
    before_action :require_login
    
    def create
        task = Task.new(task_params(:description, :job_application_id))
        task.user_id = session[:user_id]
        task.save
        redirect_back fallback_location: user_path(logged_in_user)
    end
    def update
        task = Task.find(params[:id])
        task.update(task_params(:description,:done))
        redirect_back fallback_location: user_path(logged_in_user)
    end

    def destroy
        Task.find(params[:id]).destroy
        redirect_back fallback_location: user_path(logged_in_user)
    end

    private
    def task_params(*args)
        params.require(:task).permit(*args)
    end
end
