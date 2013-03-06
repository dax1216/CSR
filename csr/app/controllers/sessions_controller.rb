class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by_username(params[:session][:username])
    
    if(user && user.authenticate(params[:session][:password]))
      sign_in user

      flash[:success] = 'Successfully logged in!'

      redirect_to user
    else
      flash[:error] = 'Invalid username/password combination'
      render 'new'
    end
  end

  def destroy
    sign_out
  end
end
