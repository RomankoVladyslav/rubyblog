class SessionsController < ApplicationController
  def new
  end

  def destroy
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user
#  end
    else
    flash.now[:danger] = 'Invalid email/password combination'
    render 'new'
    end
  end

    def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def destroy
    log_out if logged_in?
    redirect_to home_path
  end
end
