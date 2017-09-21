class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_create_params)
    project = Project.find(params[:project_id])
    @task.user = current_user
    @task.project = project
    
    if @task.save
      redirect_to project_path(project), notice: 'Making task was succeded.'
    else
      render 'new'
    end
  end

  private
  def task_create_params
    params.require(:task).permit(:title, :description, :start_on, :end_on)
  end
end