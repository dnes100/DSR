require 'test_helper'

class DsrMailerTest < ActionMailer::TestCase
  test "send_dsr" do
    mail = DsrMailer.send_dsr
    assert_equal "Send dsr", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
