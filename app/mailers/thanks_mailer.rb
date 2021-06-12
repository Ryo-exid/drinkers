class ThanksMailer < ApplicationMailer
  def thanks_email(user)
    @user = user
    mail to: user.email, subject: "会員登録完了"
  end
end
