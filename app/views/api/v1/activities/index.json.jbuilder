json.activities do |json|
  json.array! @activities do |activity|
    json.partial! activity
  end
end