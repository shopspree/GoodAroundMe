json.activity do |json|
  json.(activity, :id, :timelineable_type, :created_at, :updated_at)

  json.type activity.timelineable_type

  json.partial! activity.timelineable
  unless activity.timelineable.is_a? Post
    json.partial! activity.timelineable.post
  end

end
