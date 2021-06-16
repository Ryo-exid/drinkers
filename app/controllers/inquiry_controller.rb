class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm #確認画面
    @inquiry = Inquiry.new(inquiry_params)
    if @inquiry.valid?
      render :action => 'confirm'
    else
      render :action => 'index'
    end
  end

  def complete #完了画面
    @inquiry = Inquiry.new(inquiry_params)
    InquiryMailer.received_email(@inquiry).deliver
    render :action => 'complete'
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
