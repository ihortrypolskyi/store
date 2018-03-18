class BooksController < ApplicationController
  before_action :carousel, :side_bar, :reviews, :set_user

  def show
    @book = Book.find(params[:id])
    @reviews = Review.where(book_id: @book.id).paginate(page: params[:page], per_page: 3).order('created_at DESC')
    @review = Review.new
    @order_book = current_order.order_books.new

      unless @reviews.present?
        @avg_review = 0
      else
        @avg_review = @reviews.average(:rating).present? ? @reviews.average(:rating).round(2) : 0
      end
  end

  def index
    @order_book = current_order.order_books.new
    @show_search = true
  end

  private

  def book_params
    params.require(:book).permit(:title, :in_stock, :description, :price, :year, :isbn, :pages, :language, :image)
  end
end
