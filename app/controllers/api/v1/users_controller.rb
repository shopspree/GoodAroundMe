class Api::V1::UsersController < Api::V1::BaseController
  def edit
    @user = current_user
  end

  def update_password
    @user = User.find(current_user.id)
    if @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      #sign_in @user, :bypass => true
      # redirect_to root_path
      render json: @user, only: [:email, :authentication_token, :current_sign_in_ip], status: :ok
    else
      render json: {success: false, message: "Error with your login or password"}, status: 401
    end
  end



  def user_params
    params.required(:user).permit(:current_password, :password, :password_confirmation)
  end
end
