# frozen_string_literal: true

json.extract! user, :email, :first_name, :last_name, :gender, :mobile, :address, :location
json.extract! user, :city, :country, :pincode, :created_at, :updated_at
json.url user_url(user, format: :json)
