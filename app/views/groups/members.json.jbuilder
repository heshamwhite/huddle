json.array!(@users) do |user|
  json.extract! user, :id, :username, :hashedpassword, :age, :bio, :email, :isconfirm, :usertype, :interest_id
  json.avatar_file_name  user.avatar.url(:thumb)
  json.url user_url(user, format: :json)
end