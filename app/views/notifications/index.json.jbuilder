json.array!(@notifications) do |notification|
  json.extract! notification, :id, :body, :url, :type, :user_id
  json.url notification_url(notification, format: :json)
end
