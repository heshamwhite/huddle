json.array!(@groupimages) do |groupimage|
  json.extract! groupimage, :id, :group_id, :desc
  json.url groupimage_url(groupimage, format: :json)
end
