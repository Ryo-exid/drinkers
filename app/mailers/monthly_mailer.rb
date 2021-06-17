class MonthlyMailer < ApplicationMailer

  def monthly_notification
    mail bcc: User.pluck(:email), subject: "月刊 Drinker × Drinker ニュース"
  end
end
