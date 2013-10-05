class Api::V1::FacebookController < ApplicationController

  # POST /api/v1/facebook/callback.json
  def callback
    fb_mode = params[hub.mode]
    fb_verify_token = params[hub.verify_token]
    fb_challenge = params[hub.challenge]
    logger.debug("[DEBUG] <FacebookController> Callback success for token") if fb_verify_token == 'asaf'
    logger.debug("[DEBUG] <FacebookController> callback: with params #{params}")
  end

end
