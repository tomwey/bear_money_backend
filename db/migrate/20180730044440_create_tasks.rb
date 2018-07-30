class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.integer :uniq_id
      t.string :title, null: false # 任务简介
      t.integer :task_type_id # 任务分类
      t.text :body, null: false    # 任务说明
      t.integer :money, null: false # 任务报酬
      t.integer :total_count, null: false # 任务总量
      t.integer :complete_count, default: 0 # 已做完的任务数
      t.string :approve_duration # 任务审核时长，单位为小时
      t.string :avg_approve      # 任务平均审核时长，单位为小时
      t.integer :repeat_count, default: 1 # 任务重复做的次数
      t.datetime :expired_at, null: false # 任务截止时间
      t.string :owner # 任务的所有者
      t.integer :sort, default: 0
      t.boolean :opened, default: true

      t.timestamps null: false
    end
    
    add_index :tasks, :uniq_id, unique: true
    add_index :tasks, :task_type_id
  end
end
