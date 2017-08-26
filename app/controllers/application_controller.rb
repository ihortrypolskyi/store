class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_order

  def side_bar
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end

  def carousel
    @books = Book.search(params[:search]).paginate(page: params[:page], per_page: 4).order('in_stock DESC, title').includes(:reviews)
    @carousel_first_slide = Book.order("created_at").last(6)
    @carousel_second_slide = Book.order("created_at").last(12).first(6)
  end

  def reviews
    for singlebook in @books
      @reviews = Review.where(book_id: singlebook.id)

      if @reviews.blank?
        singlebook.avg_review = 0
      else
        singlebook.avg_review = @reviews.average(:rating).round(2)
      end
    end
  end

  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  private

  def current_user
    User.where(id: session[:user_id]).first
  end
  helper_method :current_user
end
