class CategoriesController < ApplicationController
  before_action :carousel, :side_bar, :set_user

  def show
    @category = Category.find(params[:id])
    @books = @category.books.paginate(page: params[:page], per_page: 4).order('in_stock DESC, title')
    @book = Book.find(params[:id])
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

  def category_params
    params.require(:category).permit(:name, :position)
  end
end
