class CartsController < ApplicationController
  def show
    @order_books = current_order.order_books
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end
end
