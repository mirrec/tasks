class ContextsController < ApplicationController
  before_action :set_context, only: [:edit, :update, :show, :destroy]

  def index
  end

  def new
    @context = Context.new
  end

  def create
    @context = scope.new(context_params)

    if @context.save
      redirect_to context_path(@context)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @context.update(context_params)
      redirect_to context_path(@context)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @context.destroy
    redirect_to contexts_path
  end

  private

  def set_context
    @context = scope.find(params[:id])
  end

  def context_params
    params.require(:context).permit(:name)
  end

  def scope
    current_user.contexts
  end
end
