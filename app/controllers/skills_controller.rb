class SkillsController < ApplicationController
    before_action :set_skill, only: [:edit, :update, :destroy]
    before_action :set_resume
    before_action :require_user, except: [:index, :show]
    before_action :require_resume, except: [:index, :show]
  
    def new
      @skill = Skill.new
  
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def create
      @skill = Skill.new(skill_params)
      @skill.resume_id = @resume.id
  
      if @skill.save
        flash[:notice] = "Your skill was added"
        redirect_to edit_resume_path(@resume)
      else
        render 'skills/edit'
      end
    end
  
    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def update
      if @skill.update(skill_params)
        flash[:notice] = "Your skill was updated"
        redirect_to edit_resume_path(@resume)
      else
        render 'skills/edit'
      end
    end
  
    def destroy
      @skill.destroy
      flash[:notice] = "Skill was deleted"
      redirect_to edit_resume_path(@resume)
    end
  
    private
  
    def set_skill
      @skill = Skill.find_by(slug: params[:id])
    end
  
    def set_resume
      @resume = Resume.find_by(slug: params[:resume_id])
    end
  
    def skill_params
      params.require(:skill).permit(:title,:description)
    end
  end
  