class UserMailer < ApplicationMailer
  default from: 'notifications@fakebook.com'

  def welcome_email(user)
    @user = user
    @url = 'http://fakebook.com/login'
    mail(to: @user.email, subject: "Welcome to Fakebook!")
  end

end
