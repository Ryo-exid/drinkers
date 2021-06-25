class InquiryMailer < ApplicationMailer
  default from: '"Drinker × Drinker"<from@example.com>' # 送信元アドレス

  def received_email(inquiry)
    @inquiry = inquiry
    mail bcc: ENV['APPLICATION_EMAIL'], subject: "お問い合わせ[新着]"
  end
end
