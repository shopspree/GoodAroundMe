json.organization do |json|
  json.(organization, :id, :name, :followers_count, :posts_count, :about, :website_url, :image_thumbnail_url)
  json.is_followed @person.following? organization
end