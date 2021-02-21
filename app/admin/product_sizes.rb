# frozen_string_literal: true

ActiveAdmin.register ProductSize do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :size_id, :product_id, :active
  #
  # or
  #
  # permit_params do
  #   permitted = [:size_id, :product_id, :active]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
end
