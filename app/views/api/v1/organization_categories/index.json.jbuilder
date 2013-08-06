json.organization_categories do |json|
  json.array! @organization_categories do |organization_category|
    json.partial! organization_category
  end
end