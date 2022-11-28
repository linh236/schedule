# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview
  def hello
    user = Struct.new(:username, :email).new('Linh Nguyen', 'linhnq236@gmail.com')
    UserMailer.with(user: user).hello
  end
end
