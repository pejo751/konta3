class Admin::ProfileController < ApplicationController
  #before_filter :require_no_user, :only => [:new, :create]
  #before_filter :require_user, :only => [:show, :edit, :update]
  
  def new
    @user = Admin::User.new
  end
  
  def create
    @user = Admin::User.new(params[:admin_user])
    if @user.save
      flash[:notice] = "Profile registered!"
      redirect_to root_url
    else
      render :action => :new
    end
  end
  
  def show
    @user = Admin::UserSession.find.user
  end

  def edit
    @user = @current_user
  end
  
  def update
    @user = @current_user # makes our views "cleaner" and more consistent
    if @user.update_attributes(params[:admin_user])
      flash[:notice] = "Profile updated!"
      redirect_to admin_profile_url
    else
      render :action => :edit
    end
  end

end
