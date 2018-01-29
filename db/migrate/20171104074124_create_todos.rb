class CreateTodos < ActiveRecord::Migration[5.1]
  def change
    create_table :todos do |t|
      t.string :title
      t.text :content
      t.date :deadlien
      t.boolean :done

      t.timestamps
    end
  end
end
