class UsersController < ApplicationController
  before_action :set_user, only: [:new, :show, :edit, :update, :destroy]

  # before_action :authenticate_with_http_digest
  # # ???

  # GET /users
  def index
    @users = User.all
  end

  # GET /users/1
  def show
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end

  # GET /users/new
  def new
    @user = User.new
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to :back
      flash[:notice] = 'You have successfully signed up.'
    else
      redirect_to :back
      flash[:alert] = 'Please fill in the form properly.'
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'User was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    redirect_to users_url, notice: 'User was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password )
    end

end
