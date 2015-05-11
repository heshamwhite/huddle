json.array!(@groupreplies) do |groupreply|
  json.extract! groupreply, :id, :body, :user_id, :groupmessage_id
  json.url groupreply_url(groupreply, format: :json)
end
