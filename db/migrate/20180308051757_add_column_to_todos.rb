class AddColumnToTodos < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :deadline, :datetime
  end
end
