class UserManagementController < ApplicationController
  before_action :authenticate_user!
  def index
    @users = User.all
    @title = "Users"
  end

  def show
    @user = User.find(params[:id])
  end

end
