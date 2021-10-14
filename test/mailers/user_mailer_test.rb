require 'test_helper'

class UserMailerTest < ActionMailer::TestCase

  test "account_activation" do
    user = users(:michael)
    user.activation_token = User.new_token
    mail = UserMailer.account_activation(user)
    assert_equal "Account activation", mail.subject
    assert_equal [user.email], mail.to
    assert_equal ["noreply@example.com"], mail.from
    # user.nameが本文に含まれている
    assert_match user.name,              mail.text_part.body.to_s
    assert_match user.name,              mail.html_part.body.to_s
    # user.activation_tokenが本文に含まれている
    assert_match user.activation_token,   mail.text_part.body.to_s
    assert_match user.activation_token,  mail.html_part.body.to_s
    # 特殊文字をエスケープしたuser.mailが本文に含まれている
    assert_match CGI.escape(user.email),  mail.text_part.body.to_s
    assert_match CGI.escape(user.email), mail.html_part.body.to_s
  end
end
