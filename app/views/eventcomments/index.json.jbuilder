json.array!(@eventcomments) do |eventcomment|
  json.extract! eventcomment, :id, :body, :user_id, :event_id
  json.url eventcomment_url(eventcomment, format: :json)
end
