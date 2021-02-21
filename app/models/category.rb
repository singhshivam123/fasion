# frozen_string_literal: true

# :nodoc:
class Category < ApplicationRecord
  has_many :products, dependent: :destroy
end
