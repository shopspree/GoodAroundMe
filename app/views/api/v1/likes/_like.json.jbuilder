json.like do |json|
  json.(like, :id, :likeable_id, :likeable_type, :created_at, :updated_at)

  json.user do |json|
    json.partial! like.actor.profile
  end
end

