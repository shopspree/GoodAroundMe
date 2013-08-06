json.categories do |json|
  json.array! @categories do |category|
    json.partial! category
  end
end
