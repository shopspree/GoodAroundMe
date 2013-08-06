json.organizations do |json|
  json.array! @organizations do |organization|
    json.partial! organization
  end
end