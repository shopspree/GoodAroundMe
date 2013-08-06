json.partial! @category if @category

json.subcategories do |json|
  json.array! @subcategories do |subcategory|
    json.partial! subcategory
  end
end

