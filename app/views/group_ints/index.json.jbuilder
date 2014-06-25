json.array!(@group_ints) do |group_int|
  json.extract! group_int, :id, :location, :user_id_id, :dt
  json.url group_int_url(group_int, format: :json)
end
