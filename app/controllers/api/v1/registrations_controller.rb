class Api::V1::RegistrationsController < Devise::RegistrationsController

  respond_to :json

  # POST /users/sign_up.json
  def create

    @user = User.new(email: params[:user][:email], password: params[:user][:password])

    if @user.valid? &&  @user.save
      profile = @user.person.profile
      profile.update_attributes(first_name: params[:user][:first_name],  last_name: params[:user][:last_name])


      #render json: @user, only: [:email, :authentication_token], status: :created, location: nil if
      #return
    else
      warden.custom_failure!
      error_message = if @user.errors["email"][0]
                        "Email #{@user.errors["email"][0]}"
                      elsif @user.errors["password"][0]
                        "Password #{@user.errors["password"][0]}"
                      else
                        @user.errors
                      end
      render json: {success: false, errors: error_message}, status: :unprocessable_entity
    end
  end

end
