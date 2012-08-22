ActionMailer::Base.smtp_settings = {
            :address              => "smtp.gmail.com",
            :port                 => 587,
            :domain               => 'ippi.com.ar',
            :user_name            => 'jorgepereyra751@gmail.com',
            :password             => '42535799',
            :authentication       => 'plain',
            :enable_starttls_auto => true  }
          
ActionMailer::Base.delivery_method = :smtp

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
