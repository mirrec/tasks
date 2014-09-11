class TasksController < ApplicationController
  before_action :set_project, only: [:new, :create]
  before_action :set_task, only: [:edit, :update, :cancel_update, :destroy, :toggle]

  def new
    @task = Task.new
  end

  def create
    @task = @project.tasks.build(task_params)
    @task.save
  end

  def edit
  end

  def update
    @task.update(task_params)
  end

  def cancel_update
  end

  def destroy
    @task.destroy
  end

  def toggle
    @task.toggle_and_fix_position.save
  end

  def reorder
    params[:task].try(:each_with_index) do |id, index|
      scope.find(id).update(position: index + 1, project_id: params[:project_id])
    end
    render nothing: true
  end

  private

  def task_params
    params.require(:task).permit(:completed, :name)
  end

  def set_task
    @task = scope.find(params[:id])
  end

  def set_project
    @project = current_user.projects.find(params[:project_id])
  end

  def scope
    current_user.tasks
  end
end
