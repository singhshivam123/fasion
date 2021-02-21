# frozen_string_literal: true

ActiveAdmin.register Pincode do
  permit_params :pincode, :location, :city, :country

  form do |f|
    f.inputs do
      f.input :pincode
      f.input :location
      f.input :city
      f.input :country, as: :string
    end
    f.actions
  end
end
