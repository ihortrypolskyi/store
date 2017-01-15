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
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @reviews = Review.where(book_id: @book.id).order('created_at DESC')

  end

  def index
    @books = Book.order(:title)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)

  end

  def search
    if params[:search].present?
      @books = Book.search(params[:search], fields: [:title, :description], match: :word_start)
    else
      @books = Book.all
    end

    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end

  def add_to_cart

  end

  private

  def book_params
    params.require(:book).permit(:title, :description, :price, :year, :isbn)
  end

end
