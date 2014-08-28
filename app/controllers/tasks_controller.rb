class TasksController < ApplicationController
  before_action :set_task, only: [:edit, :update, :cancel_update, :destroy, :toggle]

  def create
    @task = Project.find(params[:project_id]).tasks.build(task_params)

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
    params[:task].each_with_index do |id, index|
      Task.find(id).update(position: index + 1)
    end
    render nothing: true
  end

  private

  def task_params
    params.require(:task).permit(:completed, :name)
  end

  def set_task
    @task = Task.find(params[:id])
  end
end

