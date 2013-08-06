json.post do |json|
  json.(post, :id, :content, :created_at, :updated_at, :comments_count, :likes_count)

  json.liked_by_user liked_by_user? post, current_user

  json.medias post.medias do |media|
    json.id media.id
    json.url media.url_string
    json.type media.media_type.name
    json.created_at media.created_at
    json.updated_at media.updated_at
  end

  json.hashtags post.hashtags do |hashtag|
    json.partial! hashtag
  end


  json.user do |json|
    json.partial! post.actor.profile
  end
end
