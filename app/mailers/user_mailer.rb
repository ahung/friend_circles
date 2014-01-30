class UserMailer < ActionMailer::Base
  default from: "from@example.com"

  def reset_password_email(user)
    @user = user
    @user.reset_pw_token!
    @url =
    "http://localhost:3000/password/edit/#{@user.pw_reset_token}"
    puts "blahblahblah  #{@url}"
    mail(to:user.email, subject: "Password Reset")
  end
end
