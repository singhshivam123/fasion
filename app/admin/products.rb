# frozen_string_literal: true

ActiveAdmin.register Product do
  permit_params %i[
    name price description mrp discount category_id brand_id discount_type available slug image
  ]

  controller do
    defaults finder: :find_by_slug
  end

  # index do
  #   selectable_column
  #   id_column
  #   column :name
  #   column :category
  #   column :brand
  #   column :description
  #   column :mrp
  #   column :discount
  #   column :discount_type
  #   column :price
  #   column :available
  #   column :slug
  #   column 'image' do |image|
  #     image_tag image.image, style: 'width: 50px;'
  #   end
  #   actions
  # end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :brand
      f.input :category
      f.input :mrp
      f.input :discount
      f.input :discount_type
      f.input :price
      f.input :image, as: :file
      f.input :available
      # f.input :slug
    end
    f.actions
  end
end
