# Preview all emails at http://localhost:3000/rails/mailers/monthly_mailer
class MonthlyMailerPreview < ActionMailer::Preview
  # Preview this email at http://localhost:3000/rails/mailers/monthly_mailer/monthly_notification
  def monthly_notification
    MonthlyMailer.monthly_notification
  end
end
