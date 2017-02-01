class OrderMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.order_mailer.new_order.subject
  #
  def new_order(order)
    @order = order
    @order_books = @order.order_books

    mail to: @order.customer_email,
         subject: "#{@order.customer_first_name} #{@order.customer_last_name}, your order's in progress"
  end
end
