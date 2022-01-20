class UsersController < ApplicationController
    before_action :set_user, only: [:edit, :update]
    before_action :set_resume, only: [:edit, :update]
    before_action :require_user, except: [:new, :create]
  
    def new
      @user = User.new
      @resume = Resume.new
    end
  
    def create
      @user = User.new(user_params)
      @resume = Resume.new
      @gravatar = Gravatar.new
  
      if @user.save
        flash[:notice] = "You are registered"
  
        #associate resume
        @resume.user = @user
        @resume.save
  
        #associate gravatar
        @gravatar.user = @user
        @gravatar.use_custom_url = false
        @gravatar.show_image = true
        @gravatar.save
  
        session[:user_id] = @user.id
        session[:resume_id] = @resume.id
        redirect_to edit_resume_path(@resume)
      else
        render :new
      end
    end
  
    def edit
      if current_user.id != @user.id
        flash[:notice]
        redirect_to edit_user_path(current_user)
      end
    end
  
    def update
      if current_user.id != @user.id
        flash[:notice]
        redirect_to edit_user_path(current_user)
      end
  
      if @user.update(user_params)
        flash[:notice] = "Profile Updated"
        redirect_to edit_resume_path(@resume)
      else
        render :edit
      end
    end
  
    private
  
    def user_params
      params.require(:user).permit(:username, :password, :phone, :email, :first_name, :last_name, :address, :city, :state, :zip_code)
    end
  
    def set_user
      @user = User.find_by(slug: params[:id])
    end
  
    def set_resume
      @resume = Resume.find_by(user_id: session[:user_id])
    end
  end