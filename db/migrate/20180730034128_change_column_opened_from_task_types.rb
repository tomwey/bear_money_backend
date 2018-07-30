class ChangeColumnOpenedFromTaskTypes < ActiveRecord::Migration
  def change
    remove_column :task_types, :opened
    add_column :task_types, :opened, :boolean, default: true
  end
end
