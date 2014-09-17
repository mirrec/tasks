class AddShowCompletedToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :show_completed_tasks, :boolean, default: false
  end
end
