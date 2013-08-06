json.hashtags do |json|
  json.array! @hashtags do |hashtag|
    json.partial! hashtag
  end
end