class ProjectsController < ApplicationController
  def index
    @projects = current_user.projects
  end

  def new
  end

  def create
    project = Project.new(project_create_params)
    project_member = project.project_members.new
    project_member.user_id = current_user.id
    project_member.role = 1
    if project.save
      redirect_to :action => "index" , notice: 'success form making project.'
    else
      render 'new'
    end
  end

  def show
    @project = Project.find(params[:id])
  end

  private
  def project_create_params
    params.require(:project).permit(:name)
  end
end
