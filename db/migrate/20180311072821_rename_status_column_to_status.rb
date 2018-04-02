class RenameStatusColumnToStatus < ActiveRecord::Migration[5.1]
  def change
    rename_column :statuses, :status, :name
  end
end
