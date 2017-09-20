class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
    @project = Project.new
  end

  def create
    project = Project.new(project_create_params)
    project_member = project.project_members.new
    project_member.user_id = current_user.id
    project_member.role = 1
    if project.save
      redirect_to :action => "index" , notice: 'success for making project.'
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])
    if @project.update(project_update_params)
      redirect_to project_path(@project) , notice: 'success for updating project.'
    else
      render 'edit'
    end
  end

  private

  def project_create_params
    params.require(:project).permit(:name)
  end
  alias_method :project_update_params, :project_create_params

end
