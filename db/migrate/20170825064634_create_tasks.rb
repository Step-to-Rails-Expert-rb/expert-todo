class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :task_name, null: false
      t.text :description
      t.datetime :due_date
      t.timestamps
    end
  end
end
