# frozen_string_literal: true

# :nodoc:
class Cart < ApplicationRecord
  # validation
  validates(
    :product_id,
    numericality: true,
    uniqueness: true,
    presence: true
  )
  validates(
    :user_id, :quantity,
    numericality: { greater_than: 0 },
    presence: true
  )

  # association
  belongs_to :user
  belongs_to :product
  belongs_to :product_color
  belongs_to :product_size

  # callback
  before_validation :set_default
  before_validation :set_total

  def set_default
    self.product_color_id = 1 if product_color_id.blank?
    self.product_size_id = 1 if product_size_id.blank?
    self.quantity = 1 if quantity.blank?
  end

  def set_total
    self.total = (product.mrp * quantity)
  end
end
