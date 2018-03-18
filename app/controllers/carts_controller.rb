class CartsController < ApplicationController
  before_action :carousel, :side_bar, :set_user
  def show
    @order_books = current_order.order_books
    @order = current_order
  end
end
