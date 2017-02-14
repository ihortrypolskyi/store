class CartsController < ApplicationController
  def show
    @order_books = current_order.order_books
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @order = current_order
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
    @user = User.new
  end
end
