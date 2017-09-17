class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_task, only: [:edit, :update]

  def index
    @tasks = current_user.tasks
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params(params))
    @task.user_id = current_user.id

    if @task.save
      redirect_to tasks_path, notice: "タスクを登録しました"
    else
      render :new
    end
  end

  def edit
  end

  def update
    @task.assign_attributes(task_params(params))

    if @task.save
      redirect_to tasks_path, notice: "タスクを更新しました"
    else
      render :edit
    end
  end

  def destroy
    @task = current_user.tasks.find_by(id: params[:id])
    @task.destroy!
    redirect_to tasks_path, notice: "タスクを削除しました"
  end

  private

    def task_params(params)
      params.require(:task).permit(
        :task_name,
        :description,
        :due_date,
      )
    end

    def load_task
      @task = current_user.tasks.find_by(id: params[:id])
    end
end
