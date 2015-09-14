class UserMailer < ApplicationMailer
  default from: 'CGibson@sulivandates.com'

  def welcome_email(user)
    @user = user
    @url = 'https://www.facebook.com/groups/812762058783473/'
    mail(to: @user.email, subject: 'Thank you for signing up for Sullivan Dates notifications')
  end
end
