class Api::V1::SessionsController < Devise::SessionsController

  prepend_before_filter :require_no_authentication, only: [:create ]

  before_filter :ensure_params_exist

  def create
    @user = User.find_for_database_authentication(email: params[:user_login][:email])
    return invalid_login_attempt unless @user

    if @user.nil?
      render json: {success: false, errors: "Error with your login or password"}, status: :unauthorized
    end

    if @user.valid_password?(params[:user_login][:password])
      if !Settings['authentication.approval_required'] || @user.approved?
        sign_in(:user, @user)
        @user.reset_authentication_token!
        #render json: @user, only: [:email, :authentication_token, :current_sign_in_ip], status: :ok
      else
        number_in_line = @user.waiting_list.number_in_line if @user.waiting_list
        message = "You have not been approved yet. You are number #{number_in_line} in line. We will notify you via email once you are approved."
        render json: {success: false, errors: "You are not approved yet", data: {number_in_line: number_in_line}}, message: message, status: :forbidden
      end
    else
      render json: {success: false, errors: "Error with your login or password"}, status: :unauthorized
    end
  end

  def destroy
    resource = User.find_by_authentication_token(params[:auth_token]||request.headers["X-AUTH-TOKEN"])
    resource.authentication_token = nil
    resource.save
    sign_out(resource_name)
    render json: {success: true, errors: "sign out successfuly completed"}.to_json, status: :ok
  end

  protected
  def ensure_params_exist
    return unless params[:user_login].blank?
    render json:{success: false, errors: "missing user_login parameter"}, status: 422
  end

  def invalid_login_attempt
    warden.custom_failure!
    render json: {success: false, errors: "Error with your login or password"}, status: 401
  end

  def verified_request?
    request.content_type == "application/json" || super
  end

end