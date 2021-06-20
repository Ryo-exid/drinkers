class InquiryController < ApplicationController
  def index
    @inquiry = Inquiry.new
    render :action => 'index'
  end

  def confirm #確認画面
    if request.post?
      @inquiry = Inquiry.new(inquiry_params)
      if @inquiry.save
        render :action => 'confirm'
      else
        render :action => 'index'
      end
    else # 確認画面からリロードせずに戻った場合
      redirect_to inquiry_path
    end
  end

  def complete #完了画面
    if request.patch?
      @inquiry = Inquiry.new(inquiry_params)
      if InquiryMailer.received_email(@inquiry).deliver
        render :action => 'complete'
      else
        render :action => 'index'
      end
    else
      redirect_to inquiry_path
    end
  end

  private
  def inquiry_params
    params.require(:inquiry).permit(:name, :email, :message)
  end
end
