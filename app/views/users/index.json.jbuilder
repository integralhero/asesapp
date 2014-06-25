json.array!(@users) do |user|
  json.extract! user, :id, :name, :confirmation_code, :status, :groupInt_id, :individualInt_id
  json.url user_url(user, format: :json)
end
