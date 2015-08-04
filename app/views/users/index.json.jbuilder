json.array!(@users) do |user|
  json.extract! user, :id, :name, :texttime, :phoneno, :rainpreference, :textpreference
  json.url user_url(user, format: :json)
end
