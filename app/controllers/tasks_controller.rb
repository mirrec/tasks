class TasksController < ApplicationController
  def create
    task = Project.find(params[:project_id]).tasks.build(task_params)

    task.save

    redirect_to project_url(params[:project_id])
  end

  def toggle
    @task = Task.find(params[:id])
    @task.toggle_and_fix_position.save
  end

  def reorder
    params[:task].each_with_index do |id, index|
      Task.find(id).update(position: index + 1)
    end
    render nothing: true
  end
end

private

def task_params
  params.require(:task).permit(:completed, :name)
end
