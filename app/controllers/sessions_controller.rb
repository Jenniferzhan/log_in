class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(name: user_params[:name]).try(:authenticate, user_params[:password])
    if user
      session[:user_id] = user.id
      session[:name] = user.name
      #render plain: sprintf("welcome, %s!", user.name)
      redirect_to "/home/index"
    else
      flash.now[:login_error] = "invalid username or password"
      render "new"
    end
  end

  def logout
    session[:user_id] = nil
    session[:name] = nil
    redirect_to "/sessions/new"
  end

  private
  def user_params
    params.require(:session).permit(:name, :password)
  end
end
