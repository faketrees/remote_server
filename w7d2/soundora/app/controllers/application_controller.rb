class ApplicationController < ActionController::Base

    helper_method :logged_in?, :current_user, :current_user_id

    def login!(user) #set the user session_token equal to the session[:session_token] AKA the cookie
        session[:session_token] = user.reset_session_token!
     end

    def current_user
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
      !!current_user 
      #current_user != nil
      #!current_user == nil
    end

    def logout!
      current_user.reset_session_token! if logged_in?
      session[:session_token] = nil
      @current_user = nil
    end

    def require_logged_in
      redirect_to new_session_url unless logged_in?
    end

    def require_logged_out
      redirect_to users_url if logged_in?
    end

    def current_user_id
      current_user ? current_user.id : nil
    end
end
