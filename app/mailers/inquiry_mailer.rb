class InquiryMailer < ApplicationMailer
  default from: '"Drinker × Drinker"<from@example.com>' #送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail(:to => inquiry.email, :subject => 'お問い合わせを承りました。')
  end
end
