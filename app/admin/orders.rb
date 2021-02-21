# frozen_string_literal: true

ActiveAdmin.register Order do
  permit_params %i[
    user_id payment_id payment_mode date subtotal discount discount_type total status
  ]

  form do |f|
    f.inputs do
      f.input :user_id
      f.input :payment_id
      f.input :payment_mode
      f.input :date
      f.input :subtotal
      f.input :discount
      f.input :discount_type
      f.input :status, as: :select, collection: %w[Cancel Delivered], label: 'Status'
    end
    f.actions
  end
end
