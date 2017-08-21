  class BooksController < ApplicationController

  def show
    @book = Book.find(params[:id])
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @reviews = Review.where(book_id: @book.id).paginate(page: params[:page], per_page: 3).order('created_at DESC')
    @review = Review.new
    @order_book = current_order.order_books.new
    @books = Book.all
    @carousel_first_slide = @books.order('created_at').last(6)
    @carousel_second_slide = @books.order('created_at').last(12).first(6)
    @user = User.new

      unless @reviews.present?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
      end
    # TODO
  end

  def index
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 4).order('in_stock DESC, title').includes(:reviews)
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @order_book = current_order.order_books.new
    @carousel_first_slide = Book.order("created_at").last(6)
    @carousel_second_slide = Book.order("created_at").last(12).first(6)
    @user = User.new

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
