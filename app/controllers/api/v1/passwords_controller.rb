class Api::V1::PasswordsController < Devise::PasswordsController

  respond_to :json

  # POST /resource/password
  def create
    @user = User.send_reset_password_instructions(resource_params)

    if successfully_sent?(@user)
      respond_with status: :no_content
    else
      respond_with @user.errors, status: :unprocessable_entity
    end

  end

  protected
  def after_sending_reset_password_instructions_path_for(resource_name)
    #return your path
    Rails.logger.info "\n\n\nSent password reset email\n\n"
  end
end