class RemovePriorityFromTodo < ActiveRecord::Migration[5.1]
  def change
    remove_column :todos, :priority, :integer
  end
end
