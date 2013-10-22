class Api::V1::MetadataController < API::V1::BaseController

  # GET /api/v1/metadata.json
  def index

    @amazon_s3_id
    @amazon_s3_secret_id = ENV[""]

    @give_url

  end


end
