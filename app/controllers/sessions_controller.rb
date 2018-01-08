class SessionsController < ApplicationController
    def new
    end

    def create
        user = User.find_by(:email => params[:email])
        if user && user.authenticate(params[:password])
            puts "Inside sessionController create"
            session[:user_id] = user.id
            session[:user_name] =user.name
            redirect_to "/groups"
        else
            flash[:error] = "Invalid credentials"
            redirect_to "/"
        end
    end

    def destroy
      # Log User out
      # set session[:user_id] to null
      # redirect to login page
      reset_session
      redirect_to "/"
        
    end

end
