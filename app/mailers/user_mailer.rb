class UserMailer < ApplicationMailer
  
  default from: 'salesportalinfo@gmail.com'

  def welcome_email(user)
    @user = user
    @url  = 'localhost:300/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
