class Batch::SendMail
  def self.send_mail
    MonthlyMailer.monthly_notification.deliver_now
  end
end
