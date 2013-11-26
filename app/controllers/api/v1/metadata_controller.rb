class Api::V1::MetadataController < Api::V1::BaseController

  skip_authorize_resource

  # GET /api/v1/metadata.json
  def index

    @amazon_s3_app_id = ENV["AMAZON_S3_APP_ID"]
    @amazon_s3_app_secret = ENV["AMAZON_S3_APP_SECRET"]
    @amazon_s3_bucket = "GoodAroundMe/media";

    @give_enable = false
    @give_url = 'http://www.goodaround.me'

    @about_url = 'http://goodaroundme.herokuapp.com/about'

    @image_size_bytes_threshold = 100000

  end


end
