class HomeController < ApplicationController
  
  def index
    @user = Admin::User.new
    @user_session = Admin::UserSession.new
  end

end
