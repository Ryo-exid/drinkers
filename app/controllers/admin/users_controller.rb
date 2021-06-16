class Admin::UsersController < ApplicationController
  before_action :if_not_admin

  # 退会
  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    flash[:notice] = "該当ユーザを退会させました。"
    redirect_to root_path
  end

  private
  def if_not_admin
    redirect_to root_path unless current_user.admin? #管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  end
end
