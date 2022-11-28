class UserMailer < ApplicationMailer
  def hello
    @user = params[:user]
    attachments["image.jpg"] = File.read("tmp/image.jpg")
    mail(to: email_address_with_name(@user.email, @user.username), subject: "Hello #{@user.username}")
  end
end
