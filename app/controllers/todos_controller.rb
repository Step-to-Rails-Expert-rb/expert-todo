class TodosController < ApplicationController
before_action :authenticate_user!
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    binding.pry
    @todo = Todo.new(todo_params)
     if @todo.save
       redirect_to root_path
     else
      render 'new'
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  private

  def todo_params
    params.require(:todo).permit(:task, :detail, :deadline, :priority_id, :status_id).merge(user_id: current_user.id)
  end
end
