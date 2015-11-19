class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login_user!(user)
      redirect_to user_url
    else
      flash.now[:errors] = ["Invalid user name or password"]
    end
  end

  def destroy
    logout_user!
    redirect_to new_sesion_url
  end

  def new
    render :new
  end

end
