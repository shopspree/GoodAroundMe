class AboutsController < BaseController
  layout 'mobile'

  skip_authorize_resource

  # GET /abouts
  def index
    logger.debug "in AboutsController"

  end

end
