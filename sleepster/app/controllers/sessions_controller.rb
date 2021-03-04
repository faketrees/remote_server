class SessionsController < ApplicationController

    #3 routes new, create destroy

    def new
        render :new
    end

    def create
        #more complicated
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        if user
            login!(user)
            redirect_to user_url(user)
        else
            flash.now[:errors] = ['Invalid Credentials Jerkwad']
            render :new
        end
    end

    def destroy
        logout!
        redirect_to new_session_url
    end

#to do
    #views
    #associations
    #other models


end
