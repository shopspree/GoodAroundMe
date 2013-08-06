json.notification do |json|
  json.(notification, :is_read, :created_at)

  json.type notification.notificationable_type

  post = if notification.notificationable.is_a? Post
           json.post_id notification.notificationable
         elsif notification.notificationable.is_a? Comment
           notification.notificationable.post
         end
  json.post_id post.id

  json.user do |json|
    json.partial! notification.actor.profile
  end
end