json.group do |json|
  json.(group, :name, :created_at, :updated_at)
  json.group_type group.group_type.name if group.group_type
end
