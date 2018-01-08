class UsersController < ApplicationController
    def new
    end

    def create
        user = User.new(name: params[:name], email: params[:email], alias: params[:alias], password: params[:password], password_confirmation: params[:confirm_password])
        if user.valid?
            user.save
            puts "inside users create"
            session[:user_id] = user.id
            redirect_to "/groups"
        else
            flash[:errors] = user.errors.full_messages
            redirect_to "/"
        end

    end

    # def show
    #     @user = User.find(params[:id])
    # end

    # private

    #     def user_params
    #         params.require(:user).permit(:name, :alias, :email , :password) if params[:user].present?
    #     end
end
