# frozen_string_literal: true

# :nodoc:
class OrderProduct < ApplicationRecord
  # Association
  belongs_to :product
  belongs_to :order
  belongs_to :product_color
  belongs_to :product_size

  # callback
  after_initialize :set_default

  private

  def set_default
    self.discount = product.discount if discount.blank?
    self.discount_type = product.discount_type if discount_type.blank?
  end
end
