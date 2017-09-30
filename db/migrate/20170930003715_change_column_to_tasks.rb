class ChangeColumnToTasks < ActiveRecord::Migration[5.1]
  def change
    change_column :tasks, :description, :text, null: false, default: ""
  end
end
