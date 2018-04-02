class AddColumnToTodo < ActiveRecord::Migration[5.1]
  def change
    add_column :todos, :task, :string
    add_column :todos, :user_id, :integer
    add_column :todos, :detail, :text
  end
end
