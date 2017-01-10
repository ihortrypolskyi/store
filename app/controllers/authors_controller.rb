class AuthorsController < ApplicationController
  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def destroy
  end

  def show
    @authors = Author.order(:first_name)
    @author = Author.find(params[:id])
    @books = @author.books
    @book = Book.find(params[:id])
    @categories = Category.all
    @category = Category.find(params[:id])

  end

  def index
    @authors = Author.order(:first_name)
  end

  private

  def author_params
    params.require(:author).permit(:author_first_name, :author_last_name)
  end
end
