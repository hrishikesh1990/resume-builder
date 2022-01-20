class ResumesController < ApplicationController
    before_action :set_resume, only: [:show, :edit]
    before_action :require_user, except: [:index, :show]
    before_action :require_resume, except: [:index, :show]

  def index
    @resumes = Resume.order(created_at: :desc)
    @new_resume = Resume.new
  end

  def show
    @objective = @resume.objective
    @skills = @resume.skills
    @schools = @resume.schools
    @jobs = @resume.experiences
    @hobbies = @resume.hobbies
    @references = @resume.references
    @customs = @resume.customs
    @snippets = @resume.snippets
  end

  def edit
    @objective = Objective.new
    @skills = @resume.skills
    @schools = @resume.schools
    @jobs = @resume.experiences
    @hobbies = @resume.hobbies
    @references = @resume.references
    @customs = @resume.customs
    @snippets = @resume.snippets
  end

  private

  def set_resume
    @resume = Resume.find_by(slug: params[:id])
  end
end