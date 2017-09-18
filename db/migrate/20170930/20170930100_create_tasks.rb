class CreateTasks < ActiveRecord::Migration[5.1]

  def up
    create_table :projects do |p|
      p.string :name,              null: false
    end

    create_table :tasks do |t|
      t.references :project
      t.string :title,              null: false, limit: 240
      t.string :description,        limit: 500
      t.datetime :start_on,         null: false
      t.datetime :end_on,           null: false
      t.integer :state,             null: false, limit: 1
    end

    create_table :project_members do |pm|
      pm.references :project
      pm.references :user
      pm.integer :role,               null: false, limit: 1
    end

    create_join_table :users, :tasks, table_name: :assigns


  end

  def down
    drop_table :assigns
    drop_table :project_members
    drop_table :tasks
    drop_table :projects

  end
end