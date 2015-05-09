json.array!(@groupmessages) do |groupmessage|
  json.extract! groupmessage, :id, :title, :body, :user_id, :group_id
  json.url groupmessage_url(groupmessage, format: :json)
end
