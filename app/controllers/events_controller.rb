class EventsController < ApplicationController
    before_action :require_login
    
    def create
        event = Event.new(event_params(:title, :job_application_id, :address, :date))
        event.user_id = session[:user_id]
        event.save
        redirect_back fallback_location: user_path(logged_in_user)
    end
    def edit
        @event = Event.find(params[:id])
    end
    def update
        event = Event.update(params[:id],event_params(:title,:address, :date))
        if event.job_application_id.nil?
            redirect_to user_path(logged_in_user)
        else
            redirect_to application_path(event.job_application_id)
        end
    end

    def destroy
        Event.find(params[:id]).destroy
        redirect_back fallback_location: user_path(logged_in_user)
    end

    private
    def event_params(*args)
        params.require(:event).permit(*args)
    end
end
