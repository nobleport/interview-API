class UsersController < ApplicationController

    def index
        @users = User.all
        render json: @users
    end
    
    def create
        @user = User.new(username: params[:user][:username], password: params[:user][:password])
        if @user
            @user.save!
            render json: @user
        else
            render JSON: ['wrong username or password']
        end

    end

    def show
        @user = User.find_by(id: params[:id])
        render json: @user
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @user.destroy!

        head :no_content
    end

    # def user_params
    #     params.require(:password, :username)
    # end
end
