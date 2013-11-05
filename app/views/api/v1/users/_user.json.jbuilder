json.user do |json|
  json.(user, :email)
  json.(user.person.profile, :display_name, :first_name, :last_name, :name_prefix, :name_suffix, :picture_url, :thumbnail_url, :gender, :admin)
  json.operator (! user.person.operator.nil?).to_s

  json.following do |json|
    json.array! user.person.following do |organization|
      json.organization do |json|
        json.(organization, :id)
      end
    end
  end

  json.partial! user.person.organization if user.person.organization
end