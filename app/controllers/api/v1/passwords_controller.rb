class Api::V1::PasswordsController < Devise::PasswordsController

  respond_to :json

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    #return your path
    Rails.logger.info "\n\n\nSent password reset email\n\n"
  end
end