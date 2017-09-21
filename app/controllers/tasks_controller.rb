class TasksController < ApplicationController
  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Project.find(params[:project_id]).tasks.build
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

  def show
    @task = current_user.tasks.select{|r|r.id == params[:id].to_i}.first
    raise ActiveRecord::RecordNotFound unless @task
  end

  def edit
    @task = current_user.tasks.select{|r|r.id == params[:id].to_i}.first
    raise ActiveRecord::RecordNotFound unless @task
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_update_params)
      redirect_to project_task_path(@task.project, @task) , notice: 'success for updating task.'
    else
      render 'edit'
    end
  end

  private
  def task_create_params
    params.require(:task).permit(Task.columns.map(&:name).map(&:to_sym).reject{|r| r == :state})
  end

  def task_update_params
    params.require(:task).permit(Task.columns.map(&:name).map(&:to_sym))
  end
end