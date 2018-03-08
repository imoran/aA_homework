class UserMailer < ApplicationMailer
  default from: 'everybody@appacademy.io'

  def welcome_email
    @user = user
    @url = 'http://example.com/login'
    mail(to: user.email, subject: 'hello! (:')
  end

  def create
    msg = UserMailer.welcome_email(@user)
    msg.deliver_now

    render :root
  end
end
