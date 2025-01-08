class UsersController < ApplicationController
    before_action :authenticate_user!, only: [:show, :edit, :update]
    before_action :set_user, only: [:show, :edit, :update]
  
    def show
    end
  
    def edit
    end
  
    def update
      if @user.update(user_params)
        redirect_to @user, notice: 'Profile was successfully updated.'
      else
        render :edit
      end
    end
  
    private
  
    def set_user
      @user = current_user
    end
  
    def user_params
      params.require(:user).permit(:email, :name, :phone, :bio)
    end
  end
  