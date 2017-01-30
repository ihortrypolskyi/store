class SessionsController < ApplicationController
  def new
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
  end

  def create
    @user = User.find_by_email(params[:session][:email])
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    if @user && @user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to root_url
      flash[:notice] = 'Welcome'
    else
      render :new
    end

  end

  def destroy
    session[:user_id]= nil
    redirect_to '/'
    flash[:notice] = 'You have successfully logged out'
  end
end
