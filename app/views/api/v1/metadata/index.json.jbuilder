json.metadata do |json|
  json.amazon_s3_app_id @amazon_s3_app_id
  json.amazon_s3_app_secret @amazon_s3_app_secret
  json.amazon_s3_bucket @amazon_s3_bucket

  json.give_enabled @give_enable.to_s
  json.give_url @give_url

  json.about_url @about_url

  json.image_size_bytes_threshold @image_size_bytes_threshold
end