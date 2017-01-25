class CategoriesController < ApplicationController
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
    @categories = Category.order(:name)
    @category = Category.find(params[:id])
    @books = @category.books
    @book = Book.find(params[:id])
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

  def index
    @categories = Category.order(:name)
  end

  private

  def category_params
    params.require(:category).permit(:name, :position)
  end
end
