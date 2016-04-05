json.array!(@users) do |user|
  json.extract! user, :id, :name, :email, :password, :api_token
  json.url user_url(user, format: :json)
end
