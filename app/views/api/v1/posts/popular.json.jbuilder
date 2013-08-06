json.posts do |json|
  json.array! @posts do |post|
    json.partial! post
  end
end

