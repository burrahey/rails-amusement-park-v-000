json.array!(@users) do |user|
  json.extract! user, :id, :name, :password, :happiness, :nausea, :tickets, :height, :admin
  json.url user_url(user, format: :json)
end
