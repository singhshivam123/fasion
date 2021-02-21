# frozen_string_literal: true

json.extract! product, :id, :name, :price, :created_at, :updated_at, :description, :mrp
json.extract! product, :discount, :discount_type, :category_id, :brand_id, :available, :slug
json.url product_url(product, format: :json)
