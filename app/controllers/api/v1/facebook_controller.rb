class Api::V1::FacebookController < ApplicationController

  # POST /api/v1/facebook/callback.json
  def callback
    logger.debug("[DEBUG] <FacebookController> callback: with params #{params}")
  end

end
