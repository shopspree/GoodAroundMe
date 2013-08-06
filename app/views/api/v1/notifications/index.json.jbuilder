json.notifications do |json|
  json.array! @notifications do |notification|
    json.partial! notification
  end
end