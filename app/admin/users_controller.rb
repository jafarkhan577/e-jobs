# app/controllers/admin/users_controller.rb
class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!  # Ensure the user is logged in as admin

  # Display list of users
  def index
    @users = User.all  # Fetch all users
  end

  # Show details for a specific user
  def show
    @user = User.find(params[:id])  # Fetch user by ID
  end

  # Create a new user (if needed for admin purposes)
  def new
    @user = User.new  # Create a new user object
  end

  # Create a user (for new action)
  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to admin_users_path, notice: 'User created successfully.'
    else
      render :new
    end
  end

  # Edit user information
  def edit
    @user = User.find(params[:id])  # Find the user by ID for editing
  end

  # Update user data
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user), notice: 'User updated successfully.'
    else
      render :edit
    end
  end

  # Delete user (for admin purpose)
  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to admin_users_path, notice: 'User deleted successfully.'
  end

  private

  # Strong parameters for user
  def user_params
    params.require(:user).permit(:email, :password, :role, :first_name, :last_name)
  end
end
