json.array!(@images) do |image|
  json.thumb image.gimage.url(:thumb)
  json.img image.gimage.url

end