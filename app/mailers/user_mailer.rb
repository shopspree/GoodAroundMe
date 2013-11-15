class UserMailer < ActionMailer::Base
  default from: "no-reply@goodaround.me"

  def approval_email(user)
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
