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
    # does this break if session doesn't have a user_id set?
        User.find_by(id: session[:user_id]) ? true : false
    end

    private

    def require_login
        unless logged_in?
            flash[:notice] = "You must log in or sign up to use our awesome app."
            redirect_to root_path
        end
    end

end
