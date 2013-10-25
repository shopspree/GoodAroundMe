class Api::V1::MetadataController < API::V1::BaseController

  # GET /api/v1/metadata.json
  def index

    @amazon_s3_app_id = ENV["AMAZON_S3_APP_ID"]
    @amazon_s3_app_secret = ENV["AMAZON_S3_APP_SECRET"]

    @give_url = 'http://www.goodaround.me'

    @image_size_bytes_threshold = 100000

  end


end
