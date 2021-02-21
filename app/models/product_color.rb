# frozen_string_literal: true

# :nodoc:
class ProductColor < ApplicationRecord
  belongs_to :color
  belongs_to :product
end
