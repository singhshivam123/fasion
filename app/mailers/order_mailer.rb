# frozen_string_literal: true

# :nodoc:
class OrderMailer < ApplicationMailer
  def order_confirmation_send(order)
    @order = order
    mail(to: @order.user.email, subject: 'Welcome to My this Site!! confrim to your order')
  end

  def order_status_delivered_send(order)
    @order = order
    @order_product = @order.order_products
    @company = Company.first
    attachments["order_#{order.id}.pdf"] = WickedPdf.new.pdf_from_string(
      render_to_string(
        pdf: 'orders', template: 'order_mailer/order_status_delivered_send.html.haml',
        layout: 'pdf.html'
      )
    )
    mail(to: @order.user.email, subject: 'Your order Status delivered.')
  end

  def order_status_send(order)
    @order = order
    mail(to: @order.user.email, subject: 'Your order Status delivered.')
  end
end
