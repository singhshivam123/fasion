# frozen_string_literal: true

ActiveAdmin.register City do
  permit_params :name, :state_id, :active
end
