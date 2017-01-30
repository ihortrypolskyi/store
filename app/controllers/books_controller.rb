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
    @books = Book.all
    @categories = Category.all
    @authors = Author.all
  end

  def show
    @book = Book.find(params[:id])
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @reviews = Review.where(book_id: @book.id).order('created_at DESC')

    # @user = User.find(session[:user_id])
    @order_book = current_order.order_books.new
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)

      if @reviews.blank?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).round(2)
      end
    @reviews = Review.paginate(:page => params[:page], per_page: 3)
  end

  def index
    @books = Book.paginate(:page => params[:page], per_page: 4).order('in_stock DESC, title').includes(:reviews)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @order_book = current_order.order_books.new
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)

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
    @order_book = current_order.order_books.new

    for singlebook in @books
      @reviews = Review.where(book_id: singlebook.id)

      if @reviews.blank?
        singlebook.avg_review = 0
      else
        singlebook.avg_review = @reviews.average(:rating).round(2)
      end
    end
  end

  private

  def book_params
    params.require(:book).permit(:title, :in_stock, :description, :price, :year, :isbn, :pages, :language, :image)
  end
end