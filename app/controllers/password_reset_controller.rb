class PasswordResetController < ApplicationController
  # Method from: http://github.com/binarylogic/authlogic_example/blob/master/app/controllers/application_controller.rb
  # before_filter :require_no_user
  before_filter :load_user_using_perishable_token, :only => [ :edit, :update ]
  before_filter :set_host_from_request, only: [:create]

  def new
  end

  def create
    @user = Admin::User.find_by_email(params[:email])
    if @user
      @user.deliver_password_reset_instructions!
      flash[:notice] = "Instructions to reset your password have been emailed to you"
      redirect_to root_path
    else
      flash.now[:error] = "No user was found with email address #{params[:email]}"
      render :action => :new
    end
  end

  def edit
  end

  def update
    @user.password = params[:password]
    # Only if your are using password confirmation
    @user.password_confirmation = params[:password_confirmation]

    # Use @user.save_without_session_maintenance instead if you
    # don't want the user to be signed in automatically.
    if @user.save
      flash[:success] = "Your password was successfully updated"
      redirect_to root_url
    else
      render :action => :edit
    end
  end


  private

    def load_user_using_perishable_token
      @user = Admin::User.find_using_perishable_token(params[:id])
      unless @user
        flash[:error] = "We're sorry, but we could not locate your account"
        redirect_to root_url
      end
    end
  
    def set_host_from_request
      ActionMailer::Base.default_url_options = { host: request.host_with_port }
    end

end
