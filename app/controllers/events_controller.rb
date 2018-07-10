class EventsController < ApplicationController
    def create
        event = Event.new(event_params(:title, :job_application_id, :address, :date))
        event.user_id = session[:user_id]
        event.save
        redirect_back fallback_location: user_path(logged_in_user)
    end
    def update
        Event.update(params[:id],event_params(:title,:address, :date))
        redirect_back fallback_location: user_path(logged_in_user)
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
