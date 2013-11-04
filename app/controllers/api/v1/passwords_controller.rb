class Api::V1::PasswordsController < Devise::PasswordsController

  respond_to :json

  # POST /resource/password
  def create
    self.resource = resource_class.send_reset_password_instructions(resource_params)

    espond_with self.resource.errors, status: :unprocessable_entity unless successfully_sent?(resource)


  end

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    #return your path
    Rails.logger.info "\n\n\nSent password reset email\n\n"
  end
end