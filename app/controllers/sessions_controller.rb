class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_email(params[:session][:email])

    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to :back
      flash[:notice] = "Welcome on board, #{@user.first_name} #{@user.last_name}!"
    else
      redirect_to :back
      flash[:alert] = 'User with specified email and password does not exist.'
    end
  end

  def destroy
    session[:user_id]= nil
    redirect_to '/'
    flash[:notice] = 'You have successfully logged out'
  end
end
