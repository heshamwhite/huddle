json.array!(@groupmessages) do |groupmessage|
  json.extract! groupmessage, :id, :title, :body, :user_id, :group_id
  json.username groupmessage.user.username
  json.userimage groupmessage.user.avatar.url(:thumb)
  json.userurl user_url(groupmessage.user)
  json.url groupmessage_url(groupmessage)
end
