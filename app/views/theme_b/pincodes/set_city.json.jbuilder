# frozen_string_literal: true

# json.array! @countries, :id, :label, :value
# json.call(@countries, :id, :name)
json.array! @cities, :id, :name, :state_id
# json.array! @states, :name
