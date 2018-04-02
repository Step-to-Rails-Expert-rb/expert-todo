class AddPriorityIdToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :priority_id, :integer, foreign_key: true
  end
end
