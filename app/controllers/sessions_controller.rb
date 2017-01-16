class SessionsController < ApplicationController
  def new

    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url
      flash[:notice] = 'logged in'
    else
      render :new
    end

  end

  def destroy
    session[:user_id]= nil
    redirect_to '/'
    flash[:notice] = 'logged out'
  end
end
