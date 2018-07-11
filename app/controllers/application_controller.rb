class ApplicationController < ActionController::Base
    helper_method :logged_in_user
    helper_method :logged_in?

    def logged_in_user
        if @logged_in_user
            @logged_in_user.try(:username)
        else
            @logged_in_user = User.find_by(id: session[:user_id])
            @logged_in_user.try(:username)
        end
    end

    def logged_in?
        
        User.find_by(id: session[:user_id]) ? true : false
    end
end
