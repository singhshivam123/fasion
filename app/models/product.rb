# frozen_string_literal: true

# :nodoc:
class Product < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  scope :having_price_between, ->(minamount, maxamount) { where(price: minamount..maxamount) }

  has_one_attached :image
  belongs_to :category
  belongs_to :brand
  has_many :carts, dependent: :destroy
  has_many :order_products, dependent: :destroy
  has_many :orders, through: :order_products
  has_many :product_color, dependent: :destroy
  has_many :product_size, dependent: :destroy
end
