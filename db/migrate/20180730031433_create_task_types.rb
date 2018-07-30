class CreateTaskTypes < ActiveRecord::Migration
  def change
    create_table :task_types do |t|
      t.integer :uniq_id
      t.string :icon, null: false
      t.string :name, null: false
      t.integer :sort, default: 0
      t.integer :opened, default: true

      t.timestamps null: false
    end
    add_index :task_types, :uniq_id, unique: true
  end
end
