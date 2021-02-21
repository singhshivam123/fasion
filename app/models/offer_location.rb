# frozen_string_literal: true

# :nodoc:
class OfferLocation < ApplicationRecord
  belongs_to :offer
  belongs_to :location
end
