class AddPriorityToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :priority, :integer
  end
end
