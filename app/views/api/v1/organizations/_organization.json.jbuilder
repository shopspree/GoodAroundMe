json.organization do |json|
  json.(organization, :id, :name, :followers_count, :about, :website_url, :image_thumbnail_url, :location)
  json.posts_count actor.posts_count
  json.is_followed current_user.person.following? organization
end