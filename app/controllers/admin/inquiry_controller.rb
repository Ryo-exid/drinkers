class Admin::InquiryController < ApplicationController
  before_action :if_not_admin

  def chart
    @inquiries = Inquiry.all
  end

  def destroy
    @inquiry = Inquiry.find(params[:id])
    if @inquiry.destroy
      flash[:notice] = "お問い合わせ内容を削除しました"
      redirect_to admin_inquiry_chart_path
    end
  end

  private

  def if_not_admin
    redirect_to root_path unless current_user.admin? # 管理ユーザー以外で特定のアクションを実行しようとした場合には、トップページにリダイレクト
  end

  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
