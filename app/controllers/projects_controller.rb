class ProjectsController < ApplicationController
  before_action :set_context, only: [:new, :create]
  before_action :set_project

  def new
    @project = @context.projects.new
  end

  def create
    @project = @context.projects.build(project_params)

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
    @project.fix_position
    @project.save

    redirect_to context_path(@project.context)
  end

  private

  def set_context
    @context = Context.find(params[:context_id])
  end

  def set_project
    @project = Project.find(params[:id]) if params[:id]
  end

  def project_params
    params.require(:project).permit(:name, :description, :today)
  end
end
