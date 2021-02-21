# frozen_string_literal: true

# :nodoc:
class Order < ApplicationRecord
  # # validations
  validates(
    :user_id, :payment_id,
    numericality: { greater_than: 0 },
    presence: true
  )

  validates(
    :payment_mode,
    inclusion: { in: %w[Cash Cheque Net-Banking],
                 message: 'only allows Cash, Cheque or Net Banking' }
  )

  # association
  belongs_to :user
  has_many :order_products, dependent: :destroy
  has_many :products, through: :order_products

  # callback
  after_commit :send_conformation_mail, on: :create
  after_update :order_status_mail, if: :saved_change_to_status?

  def send_conformation_mail
    OrderMailer.with(order_id: id).order_confirmation_send(self).deliver_now
  end

  def order_status_mail
    if status == 'Delivered'
      OrderMailer.with(order_id: id).order_status_delivered_send(self).deliver_now
    else
      OrderMailer.with(order_id: id).order_status_send(self).deliver_now
    end
  end
end
