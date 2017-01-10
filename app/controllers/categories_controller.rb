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
  end

  def index
    @categories = Category.order(:name)

  end

  private

  def category_params
    params.require(:category).permit(:name, :position)
  end
end
