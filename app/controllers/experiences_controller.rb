class ExperiencesController < ApplicationController
    before_action :set_experience, only: [:edit, :update, :destroy]
    before_action :set_resume
    before_action :require_user, except: [:index, :show]
    before_action :require_resume, except: [:index, :show]
  
    def new
      @job = Experience.new
    end
  
    def create
      @job = Experience.new(experience_params)
      @job.resume_id = @resume.id
      @projects = @job.projects
      @project = Project.new
  
      if @job.save
        flash[:notice] = "Job Created"
        redirect_to edit_resume_experience_path(@resume, @job)
      else
        render 'experiences/new'
      end
    end
  
    def edit
      @projects = @job.projects
      @project = Project.new
    end
  
    def update
      if @job.update(experience_params)
        flash[:notice] = "Job Updated"
        redirect_to edit_resume_path(@resume)
      else
        render 'experiences/edit'
      end
    end
  
    def destroy
      @job.destroy
      flash[:notice] = "Job was Deleted"
      redirect_to edit_resume_path(@resume)
    end
  
    private
  
    def set_resume
      @resume = Resume.find_by(slug: params[:resume_id])
    end
  
    def set_experience
      @job = Experience.find_by(slug: params[:id])
    end
  
    def experience_params
      params.require(:experience).permit(:job_title, :company, :phone, :city, :state, :responsibilities, :url, :start_date, :end_date)
    end
  end