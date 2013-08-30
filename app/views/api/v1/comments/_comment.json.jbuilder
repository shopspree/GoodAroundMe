json.comment do |json|
  json.(comment, :id, :content, :likes_count, :commentable_id, :commentable_type, :created_at, :updated_at)
  json.partial! like_by_user(comment, current_user)

  json.user do |json|
    json.partial! comment.actor.actorable.user
  end
end

