# frozen_string_literal: true

# :nodoc:
class Offer < ApplicationRecord
  has_many :offer_locations, dependent: :destroy
  accepts_nested_attributes_for :offer_locations
end
