json.like do |json|
  json.(like, :id, :likeable_id, :likeable_type, :created_at, :updated_at)

  json.partial! like.actor.actorable.user
end

