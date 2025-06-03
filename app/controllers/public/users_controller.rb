class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def show 
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to new_user_registration_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end

  private

  def correct_user
    @user = User.find_by(id: params[:id])
    redirect_to root_path if @user != current_user
  end

end
