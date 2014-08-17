class AddTodayCheckboxToProjects < ActiveRecord::Migration
  def change
    add_column :projects, :today, :boolean, default: false
  end
end
