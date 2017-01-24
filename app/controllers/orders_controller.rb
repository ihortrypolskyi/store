class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]

  def new
    @order = Order.new
    @categories = Category.order(:name)
    @authors = Author.order(:first_name)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to :root, notice: 'Thank you for your order! Our manager will contact you within 5 hours.'
    else
      redirect_to :back
    end
  end

  def show

  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:id, :subtotal, :tax, :shipping, :total, :order_status_id, :customer_first_name, :customer_last_name, :customer_phone_number, :customer_email, :customer_house, :customer_city, :customer_postal_code )
  end


end
