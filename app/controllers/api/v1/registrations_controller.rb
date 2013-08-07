class Api::V1::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  # POST /users/sign_up.json
  def create
    @user = User.new(params[:user])

    if @user.valid?
      render json: @user, only: [:email, :authentication_token], status: :created, location: nil if @user.save
      return
    else
      warden.custom_failure!
      render json: {errors: @user.errors}, status: :unprocessable_entity
    end
  end

end
