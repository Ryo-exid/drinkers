class UsersController < ApplicationController
  before_action :find_user, only: [:show, :edit, :update]

  def index
  end

  def show
  end

  def edit
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
