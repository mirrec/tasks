class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :authenticate
  before_filter :set_contexts

  attr_reader :current_user
  helper_method :current_user

  private

  def set_contexts
    @contexts = current_user.contexts if current_user
  end

  def authenticate
    unless @current_user = User.find_by(id: session[:user_id])
      redirect_to signin_path
    end
  end

  def sign_in(user)
    session[:user_id] = user.id
  end
end
