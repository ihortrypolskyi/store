class CartsController < ApplicationController
  before_action :carousel, :side_bar
  def show
    @order_books = current_order.order_books
    @order = current_order
    @user = User.new
  end
end
