json.partial! @post

json.comments do |json|
  json.array! @comments do |comment|
    json.partial! comment
  end
end
