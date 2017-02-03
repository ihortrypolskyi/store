# Preview all emails at http://localhost:3000/rails/mailers/order_mailer
class OrderMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/order_mailer/new_order
  def new_order
    order = Order.last
    OrderMailer.new_order(order)
  end

  def new_order_admin
    order = Order.last
    OrderMailer.new_order_admin(order)
  end

end
