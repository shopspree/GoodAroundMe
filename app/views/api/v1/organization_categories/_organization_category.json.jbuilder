json.organization_category do |json|
  json.(organization_category, :id, :name, :image_url)

  json.organizations do |json|
    json.array! organization_category.organizations do |organization|
      json.organization do |json|
        json.(organization, :id, :name, :followers_count, :posts_count, :image_thumbnail_url)
        json.is_followed @person.following? organization
      end
    end
  end

end