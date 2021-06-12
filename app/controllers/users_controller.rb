class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :find_user, only: [:show, :edit, :update, :hide]

  def index
    @users = User.all
  end

  def show
  end

  def edit
    unless @user.id == current_user.id
      redirect_to user_path(current_user)
    end
  end

  def update
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  # 退会
  def hide
    @user.update(is_deleted: true)
    reset_session
    flash[:notice] = "ありがとうございました。またのご利用を心よりお待ちしております。"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end

  def find_user
    @user = User.find(params[:id])
  end
end
