# frozen_string_literal: true

ActiveAdmin.register Country do
  permit_params :name, :active
end
