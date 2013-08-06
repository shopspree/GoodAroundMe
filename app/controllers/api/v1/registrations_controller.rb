class Api::V1::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  # POST /api/v1/registrations.json
  def create
    @user = User.new(params[:user])


    if @user.valid? && @user.save
      if @user.actor && @user.actor.profile
        @user.actor.profile.update_attributes!(params[:profile]) if @user.actor.profile
      end

      render json: @user, only: [:email, :authentication_token], status: :created, location: nil
      return

    else
      warden.custom_failure!
      render json: {errors: user.errors}, status: :unprocessable_entity
    end
  end

end
