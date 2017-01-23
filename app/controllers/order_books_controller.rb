class OrderBooksController < ApplicationController
  def create
    @order = current_order
    @order_book = @order.order_books.new(order_book_params)

    @order.save
    session[:order_id] = @order.id
  end

  def update
    @order = current_order
    @order_book = @order.order_books.find(params[:id])
    @order_book.update_attributes(order_book_params)
    @order_books = @order.order_books
    respond_to do |format|
      if @order_book.save
        format.js
      else
        format.html { redirect :back }
      end
    end

  end

  def destroy
    @order = current_order
    @order_book = @order.order_books.find(params[:id])
    @order_book.destroy
    @order_books = @order.order_books
  end

  private

  def order_book_params
    params.require(:order_book).permit(:quantity, :book_id)
  end
end
