# frozen_string_literal: true

# :nodoc:
class ProductSize < ApplicationRecord
  belongs_to :size
  belongs_to :product
end
