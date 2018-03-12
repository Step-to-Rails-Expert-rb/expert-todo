class CreatePriorities < ActiveRecord::Migration[5.1]
  def change
    create_table :priorities do |t|
      t.string :priority
      t.timestamps
    end
  end
end
