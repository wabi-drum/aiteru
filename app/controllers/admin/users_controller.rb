class Admin::UsersController < ApplicationController
  layout 'admin'
  before_action :authenticate_admin!

  def show
    @user = User.find(params[:id]) 
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy 
    redirect_to admin_dashboards_path, notice: 'User was successfully removed.'
  end 
end
