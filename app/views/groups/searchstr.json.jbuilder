json.array!(@groups) do |group|
  json.extract! group, :id, :name, :lat, :log, :desc, :membertitle, :user_id
  json.url group_url(group, format: :json)
end
