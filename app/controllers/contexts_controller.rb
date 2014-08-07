class ContextsController < ApplicationController
  def index
  end

  def show
    @context = Context.find(params[:id])
  end
end
