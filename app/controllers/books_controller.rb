class BooksController < ApplicationController
  def new
    @book = Book.new
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
    @book = Book.find(params[:id])
    @categories = Category.all
    @authors = Author.all
  end

  def index
    @books = Book.all
    @categories = Category.all
  end

  def add_to_cart

  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :year, :isbn)
  end

end
