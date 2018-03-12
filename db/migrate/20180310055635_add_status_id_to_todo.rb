class AddStatusIdToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :status_id, :integer, foreign_key: true
  end
end
