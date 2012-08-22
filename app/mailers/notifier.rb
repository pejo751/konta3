class Notifier < ActionMailer::Base

  default :from => "jorgepereyra751@gmail.com"

  def deliver_password_reset_instructions(user)
    @user = user
    @url = edit_password_reset_url(@user.perishable_token)
    mail(
      :to => user.email,
      :subject => "Password Reset Instructions") do |format|
        format.html
      end
  end

end
