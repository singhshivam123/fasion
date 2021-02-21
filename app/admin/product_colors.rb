# frozen_string_literal: true

ActiveAdmin.register ProductColor do
  permit_params :color_id, :product_id, :active

  form do |f|
    f.inputs do
      f.input :color
      f.input :product
      f.input :active
    end
    f.actions
  end
end
