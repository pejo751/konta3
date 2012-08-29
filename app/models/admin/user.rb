class Admin::User < ActiveRecord::Base

  attr_accessible :login, :nombre, :password, :login_fallidos, :failed_login_count, :last_request_at,
    :password_confirmation, :current_login_at, :last_login_at, :email, :current_login_ip, :login_count,
    :last_login_ip, :foto, :foto_file_name, :foto_content_type, :foto_file_size, :foto_updated_at

	acts_as_authentic do |c|
		c.validate_email_field = false
	end

  def deliver_password_reset_instructions!
    reset_perishable_token!
    Notifier.deliver_password_reset_instructions(self).deliver
  end
  
  def login_nombre
		"#{self.login} (#{self.nombre})"
	end

  has_attached_file :foto,
      :default_url => 'user_blank.gif',
      :storage => :s3,
      :s3_credentials => Rails.root.join("config", "s3.yml"),
      :path => "/konta3/fotos_de_usuarios/:id/:basename.:extension"

  validates_attachment_size :foto, :less_than => 1.megabytes,
    :message => "es demasiado grande. Debe pesar menos de 1 mb."

  validates_attachment_content_type :foto,
    :content_type => ['image/png', 'image/jpeg', 'image/gif', 'image/bmp'],
    :message => "debe ser .png, .jpg, .gif o .bmp"

end
