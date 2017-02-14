class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @order = Order.new
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @order_book = @order.order_books.new
    @order_books = @order.order_books
  end

  def create
    @order = Order.new(order_params)
  end

  def edit
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
    @carousel_first_slide = Book.order("created_at").last(4)
    @carousel_second_slide = Book.order("created_at").last(8).first(4)
    @user = User.new
  end

  def update
      if @order.update(order_params)
        session[:order_id] = nil
        redirect_to :root, notice: 'Thank you for order! Our manager will contact you within 1 hour.'
        OrderMailer.new_order(@order).deliver_now
        OrderMailer.new_order_admin(@order).deliver_now
      else
        render :edit
      end
  end

 private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:id, :subtotal, :tax, :shipping, :total, :order_status_id,
                                  :customer_first_name, :customer_last_name, :customer_phone_number, :customer_email, :customer_house, :customer_city, :customer_postal_code )
  end

  def order_book_params
    params.require(:order_book).permit(:quantity, :book_id)
  end

end
