class UserMailer < ApplicationMailer
  default from: 'CGibson@SullivanDates.com'

  def welcome_email(user)
    @user = user
    @url = 'https://www.facebook.com/groups/812762058783473/'
    mail(to: @user.email, subject: 'Sullivan Dates | Coming soon')
  end
end
