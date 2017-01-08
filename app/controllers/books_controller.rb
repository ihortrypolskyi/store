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
  end

  def index
    @books = Book.all
  end

  def add_to_cart

  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :year, :isbn)
  end

end
