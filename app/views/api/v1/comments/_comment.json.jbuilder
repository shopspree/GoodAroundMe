json.comment do |json|
  json.(comment, :id, :content, :likes_count, :commentable_id, :commentable_type, :created_at, :updated_at)

  like = like_by_user(comment, current_user)
  json.partial! like if like

  json.partial! comment.actor.actorable.user
end

