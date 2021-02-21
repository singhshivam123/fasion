# frozen_string_literal: true

# :nodoc:
class Location < ApplicationRecord
  has_many :offer_locations, dependent: :destroy
end
