# frozen_string_literal: true

# :nodoc:
class Brand < ApplicationRecord
  has_many :products, dependent: :destroy
end
