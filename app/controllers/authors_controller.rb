class AuthorsController < ApplicationController
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
    @authors = Author.order(:first_name)
    @author = Author.find(params[:id])
    @books = @author.books
    # @books = @author.books.by_category_and_author(params[:category], params[:author])
    @book = Book.find(params[:id])
    @categories = Category.order(:name)
    @category = Category.find(params[:id])
    @order_book = current_order.order_books.new

  end

  def index
    @authors = Author.order(:first_name)
  end

  private

  def author_params
    params.require(:author).permit(:author_first_name, :author_last_name)
  end
end
