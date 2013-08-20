json.user do |json|
  json.(user, :email)
  json.(user.person.profile, :full_name, :first_name, :gender, :last_name, :name_prefix, :name_suffix, :picture_url, :thumbnail_url)

  json.following do |json|
    json.array! user.person.following do |organization|
      json.organization do |json|
        json.(organization, :id)
      end
    end
  end
end