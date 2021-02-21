# frozen_string_literal: true

ActiveAdmin.register Company do
  permit_params :name, :address, :mobile, :email, :theme

  form do |f|
    f.inputs do
      f.input :name
      f.input :address
      f.input :mobile
      f.input :email
      f.input :theme, as: :select, collection: %w[theme_a theme_b], label: 'Theme'
    end
    f.actions
  end
end
