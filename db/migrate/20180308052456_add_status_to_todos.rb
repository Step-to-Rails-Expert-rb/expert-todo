class AddStatusToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :status, :integer
  end
end
