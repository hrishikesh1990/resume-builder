class ProjectsController < ApplicationController
    before_action :set_project, only: [:edit, :update, :destroy]
    before_action :set_experience
    before_action :set_resume
    before_action :require_user, except: [:index, :show]
    before_action :require_resume, except: [:index, :show]
  
    def create
      @project = Project.new(project_params)
      @project.experience_id = @job.id
  
      if @project.save
        flash[:notice] = "Project Saved"
        redirect_to edit_resume_experience_path(@resume, @job)
      else
        render 'experiences/edit'
      end
    end
  
    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def update
      if @project.update(project_params)
        flash[:notice] = "Project Updated"
        redirect_to edit_resume_experience_path(@resume, @job)
      else
        render 'experiences/edit'
      end
    end
  
    def destroy
      @project.destroy
      flash[:notice] = "Project Deleted"
      redirect_to edit_resume_experience_path(@resume, @job)
    end
  
    private
  
    def set_project
      @project = Project.find_by(slug: params[:id])
    end
  
    def set_experience
      @job = Experience.find_by(slug: params[:experience_id])
    end
  
    def set_resume
      @resume = Resume.find_by(slug: params[:resume_id])
    end
  
    def project_params
      params.require(:project).permit(:name, :description, :url)
    end
  
  end