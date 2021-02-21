# frozen_string_literal: true

json.extract! order, :id, :user_id, :payment_id, :payment_mode, :date, :subtotal, :discount
json.extract! order, :discount_type, :total, :created_at, :updated_at
json.url order_url(order, format: :json)
