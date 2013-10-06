class Api::V1::FacebookController < ApplicationController

  # POST /api/v1/facebook/callback
  def callback
    fb_mode = params["hub.mode"]
    fb_verify_token = params["hub.verify_token"]
    fb_challenge = params["hub.challenge"]

    logger.debug("[DEBUG] <Api::V1::FacebookController> Callback success for token") if fb_verify_token == 'asaf'
    logger.debug("[DEBUG] <Api::V1::FacebookController> callback: with params #{params}")

    render text: fb_challenge
  end

end
