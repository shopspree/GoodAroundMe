json.organization do |json|
  json.(organization, :id, :name, :followers_count, :posts_count, :about, :website_url, :image_thumbnail_url, :location)
  json.is_followed @user.person.following? organization
end