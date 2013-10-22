json.post do |json|
  json.(post, :id, :title, :caption, :created_at, :updated_at, :comments_count, :likes_count)

  case post.contributor.actorable
    when Person
      json.contributor post.contributor.actorable.profile.display_name
      json.partial! post.contributor.actorable.user
    when Robot
      json.contributor post.contributor.actorable.display_name
  end

  like = like_by_user(post, current_user)
  json.partial! like if like

  json.medias post.medias do |media|
    json.partial! media.mediable
  end

  json.partial! post.actor.actorable
end
