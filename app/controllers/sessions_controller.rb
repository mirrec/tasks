class SessionsController < ApplicationController
  layout 'authentication'
  skip_before_action :authenticate

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      sign_in user
      redirect_to root_path
    else
      flash.now[:alert] = 'Wrong email/password combination'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to signin_path
  end
end
