# frozen_string_literal: true

# json.array! @countries, :id, :label, :value
json.array! @countries do |countries|
  json.id countries.id
  json.label countries.name
  json.value countries.name
end
