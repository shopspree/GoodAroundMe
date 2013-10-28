class Api::V1::MetadataController < Api::V1::BaseController

  # GET /api/v1/metadatas.json
  def index

    @amazon_s3_app_id = ENV["AMAZON_S3_APP_ID"]
    @amazon_s3_app_secret = ENV["AMAZON_S3_APP_SECRET"]

    @give_enable = false
    @give_url = 'http://www.goodaround.me'

    @about_url = 'http://www.goodaround.me/about'

    @image_size_bytes_threshold = 100000

  end


end
