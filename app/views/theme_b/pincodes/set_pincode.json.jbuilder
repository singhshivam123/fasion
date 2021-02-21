# frozen_string_literal: true

# json.partial! 'pincodes/pincode', pincode: @pincode

# json.content format_content(@pincode.content)
json.call(@pincode, :location, :city, :country)
