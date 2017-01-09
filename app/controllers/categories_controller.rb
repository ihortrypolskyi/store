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
    @categories = Category.all
    @category = Category.find(params[:id])
    @books = @category.books
    @book = Book.find(params[:id])
    @authors = Author.all
  end

  def index
    @categories = Category.all

  end

  private

  def category_params
    params.require(:category).permit(:name, :position)
  end
end
