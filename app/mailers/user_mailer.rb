class UserMailer < ApplicationMailer
  default from: 'exampleapp@gmail.com'

  def welcome_email
    @user = params[:user]
    @url = 'http://localhost:3000/users/log_in'
    mail(to: @user.email, subject: 'Welcome to Book Face')
  end
end
