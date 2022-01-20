class GravatarsController < ApplicationController
    before_action :set_gravatar
    before_action :set_user
  
    def edit
  
    end
  
    def update
      if @gravatar.update(params.require(:gravatar).permit(:show_image, :use_custom_url, :custom_image_url))
        flash[:notice] = "Gravatar settings updated"
        redirect_to edit_user_path(@user)
      else
        render :edit
      end
    end
  
    private
  
    def set_gravatar
      @gravatar = Gravatar.find(params[:id])
    end
  
    def set_user
      @user = User.find_by(slug: params[:user_id])
    end
  end