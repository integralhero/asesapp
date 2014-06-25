json.array!(@individual_ints) do |individual_int|
  json.extract! individual_int, :id, :location, :user_id_id, :dt
  json.url individual_int_url(individual_int, format: :json)
end
