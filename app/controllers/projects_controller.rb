class ProjectsController < ApplicationController
  
  layout false

  before_action :find_project, :only => [:show, :edit, :update, :delete, :destroy]

  def index
    @projects = Project.all
  end

  def show
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      flash[:notice] = "Project successfully created."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def edit
  end

  def update
    if @project.update_attributes(project_params)
      flash[:notice] = "Project successfully updated."
      redirect_to(:action => 'index')
    else
      render('new')
    end
  end

  def delete
  end

  def destroy
    @project.delete
    flash[:notice] = "Project successfully deleted."
    redirect_to(:action => 'index')
  end

  private
    def find_project
      @project = Project.find(params[:id])
    end

    def project_params
      params.require(:project).permit(:title, :description, :due_date, :completed)
    end
end
