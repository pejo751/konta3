# -*- encoding : utf-8 -*-
class Admin::UserSessionController < ApplicationController

  def new
    @user_session = Admin::UserSession.new
  end

  def create
    @user_session = Admin::UserSession.new(params[:admin_user_session])
    if params[:commit] == 'Registrarse'
      redirect_to new_admin_profile_url and return
    end
    if @user_session.save
      redirect_to root_url
    else
      render :action => "new"
    end
  end

  def destroy
    current_user_session.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.js  #added
    end
  end

end
