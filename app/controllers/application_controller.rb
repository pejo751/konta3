# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base

  protect_from_forgery
  helper_method :current_user_session, :current_user
  before_filter :current_user

  private
    def current_user_session
      return @current_user_session if defined?(@current_user_session)
      @current_user_session = Admin::UserSession.find
    end
    
    def current_user
      return @current_user if defined?(@current_user)
      @current_user = current_user_session && current_user_session.user
    end
end
