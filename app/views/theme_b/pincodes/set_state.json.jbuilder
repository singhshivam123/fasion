# frozen_string_literal: true

# json.array! @countries, :id, :label, :value
# json.call(@countries, :id, :name)
json.array! @states, :id, :name, :country_id
# json.array! @states, :name
