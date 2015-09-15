class UserMailer < ApplicationMailer
  default from: 'CGibson@SullivanDates.com'

  def sigup_notify(user)
    @user = user
    @email = @user.email
    @zip = @user.zip_code
    mail(to: cgibsonmm@gmail.com, subject: 'New User = #{@email}')
  end
end
