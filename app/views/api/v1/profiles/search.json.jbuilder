json.user do
  json.profiles do |json|
    json.array! @profiles do |profile|
      json.partial! profile
    end
  end
end