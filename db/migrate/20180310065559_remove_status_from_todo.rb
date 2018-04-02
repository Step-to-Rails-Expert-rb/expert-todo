class RemoveStatusFromTodo < ActiveRecord::Migration[5.1]
  def change
    remove_column :todos, :status, :integer
  end
end
