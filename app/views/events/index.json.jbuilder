json.array!(@events) do |event|
  json.extract! event, :id, :name, :lat, :log, :desc, :date, :group_id
  json.url event_url(event)
  usrs=event.users
  usrs.each do |u|
    u.avatar_file_name = u.avatar.url(:thumb)
  end
  json.members usrs
end
