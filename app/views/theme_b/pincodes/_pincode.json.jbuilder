# frozen_string_literal: true

json.extract! pincode, :pincode, :location, :area
json.url pincode_url(pincode, format: :json)
