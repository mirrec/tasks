class ProjectsController < ApplicationController
  before_action :set_project, except: [:show]
  before_action :authorize_context, only: [:update]

  def new
    @project = scope.new
  end

  def create
    @project = scope.build(project_params)

    if @project.save
      redirect_to project_url(@project)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to project_url(@project)
    else
      render 'edit'
    end
  end

  def show
    @project = scope.includes(:completed_tasks, :uncompleted_tasks).find(params[:id])
  end

  def destroy
    @project.destroy
    redirect_via_turbolinks_to context_path(@project.context)
  end

  def archive
    @project.archived!
    redirect_via_turbolinks_to context_path(@project.context)
  end

  def cancel_new_task
  end

  def toggle_today
    @project.toggle(:today)
    @project.save
    @project.fix_position

    redirect_to context_path(@project.context)
  end

  def toggle_show_completed_tasks
    @project.toggle(:show_completed_tasks)
    @project.save
  end

  def reorder
    params[:project].try(:each_with_index) do |id, index|
      scope.find(id).update(position: index + 1)
    end
    render nothing: true
  end

  private

  def set_project
    @project = scope.find(params[:id]) if params[:id]
  end

  def project_params
    params.require(:project).permit(:name, :description, :today, :context_id)
  end

  def scope
    if params[:context_id]
      context.projects
    else
      current_user.projects
    end
  end

  def context
    current_user.contexts.find(params[:context_id])
  end

  def authorize_context
    redirect_to @project unless current_user.context_ids.include?(project_params[:context_id].to_i)
  end
end
