class OrderMailer < ApplicationMailer

 def new_order(order)
      @order = order
      @order_books = @order.order_books
      mail to: @order.customer_email,
           subject: "#{@order.customer_first_name} #{@order.customer_last_name}, your order's in progress"
  end

  def new_order_admin(order)
      @order = order
      @order_books = @order.order_books
      mail to: ADMIN_EMAIL, subject: "Order #{@order.id} from #{@order.customer_email}"
  end
end
