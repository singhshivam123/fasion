# frozen_string_literal: true

ActiveAdmin.register State do
  permit_params :name, :country_id, :active
end
