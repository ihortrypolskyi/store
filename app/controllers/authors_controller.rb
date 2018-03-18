class AuthorsController < ApplicationController
  before_action :carousel, :side_bar, :set_user

  def show
    @author = Author.find(params[:id])
    @books = @author.books.paginate(page: params[:page], per_page: 4).order('in_stock DESC, title')
    # @books = @author.books.by_category_and_author(params[:category], params[:author])
    @book = Book.find(params[:id])
    @category = Category.find(params[:id])
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

  def index
    @authors = Author.order(:first_name)
  end

  private

  def author_params
    params.require(:author).permit(:first_name, :last_name)
  end
end
