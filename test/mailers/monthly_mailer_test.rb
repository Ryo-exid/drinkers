require 'test_helper'

class MonthlyMailerTest < ActionMailer::TestCase
  test "monthly_notification" do
    mail = MonthlyMailer.monthly_notification
    assert_equal "Monthly notification", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end
end
