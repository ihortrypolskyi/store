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
    @books = Book.order(:title).includes(:reviews)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)

  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @reviews = Review.where(book_id: @book.id).order('created_at DESC')
    @user = User.find(session[:user_id])


      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
      end
  end

  def index
    @books = Book.order(:title).includes(:reviews)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)

    for singlebook in @books
      @reviews = Review.where(book_id: singlebook.id)

      if @reviews.blank?
        singlebook.avg_review = 0
      else
        singlebook.avg_review = @reviews.average(:rating).round(2)
      end
    end
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
    params.require(:book).permit(:title, :description, :price, :year, :isbn, :image)
  end
end