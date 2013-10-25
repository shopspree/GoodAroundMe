json.metadata do |json|
  json.amazon_s3_app_id @amazon_s3_app_id
  json.amazon_s3_app_secret @amazon_s3_app_secret

  json.give_url @give_url

  json.image_size_bytes_threshold @image_size_bytes_threshold
end