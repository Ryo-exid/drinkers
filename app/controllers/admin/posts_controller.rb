class Admin::PostsController < ApplicationController
  before_action :if_not_admin

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    flash[:notice] = "該当ユーザの投稿を削除しました。"
    redirect_to posts_path
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin? # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  end
end
