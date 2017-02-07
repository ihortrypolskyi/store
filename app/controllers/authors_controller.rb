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
    @books = @author.books.paginate(page: params[:page], per_page: 4).order('in_stock DESC, title')
    # @books = @author.books.by_category_and_author(params[:category], params[:author])
    @book = Book.find(params[:id])
    @categories = Category.order(:name)
    @category = Category.find(params[:id])
    @order_book = current_order.order_books.new
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
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

  def index
    @authors = Author.order(:first_name)
  end

  private

  def author_params
    params.require(:author).permit(:author_first_name, :author_last_name)
  end
end
