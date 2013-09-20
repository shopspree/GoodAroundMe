logger.debug("[DEBUG] <index.json.jbuilder> Posts: count on organization #{ @posts.count}")
json.posts do |json|
  json.array! @posts do |post|
    json.partial! post
    logger.debug("[DEBUG] <index.json.jbuilder> Post: title #{post.title}")
  end
end
