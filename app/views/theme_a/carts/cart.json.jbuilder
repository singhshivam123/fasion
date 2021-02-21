# frozen_string_literal: true

json.extract! cart, :id, :user_id, :product_id, :product_color_id, :product_size_id
json.extract! cart, :quantity, :total, :created_at, :updated_at
json.url cart_url(cart, format: :json)
