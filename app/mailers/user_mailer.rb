class UserMailer < ApplicationMailer
  default from: 'CGibson@SullivanDates.com'

  def welcome_email(user)
    @user = user
    @url = 'https://www.facebook.com/groups/812762058783473/'
    mail(to: @user.email, subject: 'Sullivan Dates | Coming soon')
  end

  def signup_notify(user)
    @user = user
    @email = user.email
    @zip = user.zip_code
    @myemail = "cgibsonmm@gmail.com"
    mail(to: @myemail, subject: 'New User')
  end
end
