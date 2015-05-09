json.array!(@events) do |event|
  json.extract! event, :id, :name, :lat, :log, :desc, :date, :group_id
  json.url event_url(event, format: :json)
end
