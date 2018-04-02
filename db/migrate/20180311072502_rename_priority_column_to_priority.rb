class RenamePriorityColumnToPriority < ActiveRecord::Migration[5.1]
  def change
    rename_column :priorities, :priority, :name
  end
end
