class Admin::User < Basico::MaestroBase

  attr_accessible :login, :nombre, :password, :login_fallidos, :failed_login_count, :last_request_at,
    :password_confirmation, :current_login_at, :last_login_at, :email, :current_login_ip, :login_count,
    :last_login_ip

	acts_as_authentic do |c|
		c.validate_email_field = false
	end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self).deliver
  end
  
  def login_nombre
		self.login + ' (' + self.nombre + ')'
	end

end
