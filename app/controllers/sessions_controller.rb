class SessionsController < ApplicationController

  skip_before_filter :authenticate, :only => [:new, :create]

  def new
    redirect_to rooms_path unless !signed_in?
  end

  def create
    user = User.find_by_login(params[:session][:login])
    if user && user.password == params[:session][:password]
      sign_in user
      redirect_to rooms_path
    else
      flash.now[:error] = "Login ou senha invalidos!"
      render 'new'
    end
  end
  
  def destroy
    sign_out
    redirect_to root_path
  end
  
  
end
