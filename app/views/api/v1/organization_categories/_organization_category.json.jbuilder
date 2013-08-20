json.organization_category do |json|
  json.(organization_category, :id, :name, :image_url)

  json.organizations do |json|
    json.array! organization_category.organizations do |organization|
      json.partial! organization
    end
  end

end