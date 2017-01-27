class CartsController < ApplicationController
  def show
    @order_books = current_order.order_books
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @order = current_order
    # @order = Order.find(session[:order_id])
  end
end
