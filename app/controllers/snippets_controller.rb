class SnippetsController < ApplicationController
    before_action :set_snippet, only: [:edit, :update, :destroy]
    before_action :set_resume
    before_action :require_user, except: [:index, :show]
    before_action :require_resume, except: [:index, :show]
  
    def new
      @snippet = Snippet.new
  
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def create
      @snippet = Snippet.new(snippet_params)
      @snippet.resume_id = @resume.id
  
      if @snippet.save
        flash[:notice] = "Your snippet was added"
        redirect_to edit_resume_path(@resume)
      else
        render 'snippets/edit'
      end
    end
  
    def edit
      respond_to do |format|
        format.html
        format.js
      end
    end
  
    def update
      if @snippet.update(snippet_params)
        flash[:notice] = "Your Snippet was updated"
        redirect_to edit_resume_path(@resume)
      else
        render 'snippets/edit'
      end
    end
  
    def destroy
      @snippet.destroy
      flash[:notice] = "Snippet was deleted"
      redirect_to edit_resume_path(@resume)
    end
  
    private
  
    def set_snippet
      @snippet = Snippet.find_by(slug: params[:id])
    end
  
    def set_resume
      @resume = Resume.find_by(slug: params[:resume_id])
    end
  
    def snippet_params
      params.require(:snippet).permit(:title, :description, :programming_language, :code)
    end
  end