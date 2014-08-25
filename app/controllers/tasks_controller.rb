class TasksController < ApplicationController
  def create
    task = Project.find(params[:project_id]).tasks.build(task_params)

    task.save

    redirect_to project_url(params[:project_id])
  end

  def toggle
    @task = Task.find(params[:id])
    @task.toggle(:completed).save
  end

  private

  def task_params
    params.require(:task).permit(:completed, :name)
  end
end
