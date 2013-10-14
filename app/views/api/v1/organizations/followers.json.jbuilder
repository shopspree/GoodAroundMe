json.followers do |json|
  json.array! @organization.followers do |person|
    json.(person.user, :email)
    json.(person.profile, :display_name, :first_name, :last_name, :name_prefix, :name_suffix, :picture_url, :thumbnail_url, :gender)
  end
end