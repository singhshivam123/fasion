# frozen_string_literal: true

ActiveAdmin.register User do
  permit_params %i[
    email encrypted_password reset_password_token reset_password_sent_at remember_created_at
    first_name last_name gender mobile address location city country pincode state
  ]

  form do |f|
    f.inputs do
      f.input :email
      f.input :encrypted_password
      f.input :reset_password_token
      f.input :reset_password_sent_at
      f.input :remember_created_at
      f.input :first_name
      f.input :last_name
      f.input :gender
      f.input :mobile
      f.input :address
      f.input :location
      f.input :state
      f.input :city
      f.input :country, as: :string
      f.input :pincode
    end
    f.actions
  end
end
