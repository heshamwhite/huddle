json.array!(@groupreplies) do |groupreply|
  json.extract! groupreply, :id, :body, :user_id, :groupmessage_id
  json.username groupreply.user.username
  json.userimage groupreply.user.avatar.url(:thumb)
  json.userurl user_url(groupreply.user)
  json.url groupreply_url(groupreply, format: :json)
end
