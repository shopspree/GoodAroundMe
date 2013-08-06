json.partial! @commentable

json.comments do |json|
  json.array! @commentable.comments do |comment|
    json.partial! comment
  end
end
