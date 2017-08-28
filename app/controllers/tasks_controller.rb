class TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy, :finish]

  # GET /tasks
  def index
    @tasks = task_list
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)

    if @task.save
      @tasks = task_list
      render :create
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    if @task.update(task_params)
      @tasks = task_list
      render :create
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    @task.destroy
    redirect_to tasks_url, notice: '削除しました'
  end

  # タスクの完了
  def finish
    @tasks = task_list
    @task.update(status: 2, finished_at: Time.zone.today)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(Task::REGISTRABLE_ATTRIBUTES)
    end

    def task_list
      Task.where(user_id: @current_user.id).order('scheduled_end_at, status')
    end
end
