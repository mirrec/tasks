class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :set_contexts
  before_filter :authenticate if Rails.env.production?

  private

  def set_contexts
    @contexts = Context.all
  end

  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == ENV['login'] && password == ENV['password']
    end
  end
end
