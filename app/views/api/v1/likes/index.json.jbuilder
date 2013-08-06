json.partial! @likeable

json.likes do |json|
  json.array! @likes do |like|
    json.partial! like
  end
end
