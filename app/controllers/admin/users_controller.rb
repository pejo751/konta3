# -*- encoding : utf-8 -*-
class Admin::UsersController < ApplicationController

	# before_filter :require_user
	# before_filter :es_jorge

	# GET /users
	def index
		@users = params[:format] == 'xls' ? Admin::User.all : (Admin::User.all(:order => 'id DESC'))
		respond_to do |format|
	 		format.html # index.html.erb
			#format.xls
		end
	end
	
	# GET /users/1
	def show
		@user = Admin::User.find(params[:id])
	end
	
	# GET /users/new
	def new
		@user = Admin::User.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @usuario }
    end
	end
	
	# GET /users/1/edit
	def edit
		@user = Admin::User.find(params[:id])
	end
	
	# POST /users
	def create
		@user = Admin::User.new(params[:admin_user])
		if @user.save
			redirect_to(@user)
		else
			render :action => "new"
		end
	end
	
	# PUT /users/1
	def update
		@user = Admin::User.find(params[:id])
		if @user.update_attributes(params[:admin_user])
			redirect_to(@user)
		else
			render :action => "edit"
		end
	end
	
	# DELETE /users/1
	def destroy
		@user = Admin::User.find(params[:id])
		@user.destroy
	  	redirect_to(admin_users_url)
	end

end
