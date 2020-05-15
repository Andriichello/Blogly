class UsersController < ApplicationController

    def index 
        
    end

    def create
        alia = User.find_by(email:user_params[:email])
        user = User.new(user_params)
        if User.find_by(email:user_params[:email])
            flash[:register_errors] = ['This EMAIL was already registered!']
            redirect_to '/register'
        elsif User.find_by(email:user_params[:name])
            flash[:register_errors] = ['This NAME was already registered!']
            redirect_to '/register'
        elsif user.save 
            session[:user_id] = user.id
            redirect_to '/posts'
        else
            flash[:register_errors] = user.errors.full_messages
            redirect_to '/register'
        end
    end

    def new 

    end

    def show
        @profile = User.find_by(id:params[:id])
        # @user = User.find_by(id:session[:user_id])
    end

    private 
        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end
