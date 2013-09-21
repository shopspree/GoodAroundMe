json.organization do |json|
  json.(organization, :id, :name, :about, :website_url, :image_thumbnail_url, :location)
  json.followers_count organization.followers.count
  json.posts_count organization.actor.posts_count
  json.is_followed current_user.person.following? organization
end