class CreateTaskSteps < ActiveRecord::Migration
  def change
    create_table :task_steps do |t|
      t.integer :_type, null: false # 步骤类型 0 表示图文 1 表示提交文本 2 表示提交图片
      t.text :content, null: false  # 步骤说明
      t.text :memo # 步骤帮助
      t.integer :task_id, null: false # 所属任务
      t.timestamps null: false
    end
    add_index :task_steps, :task_id
  end
end
