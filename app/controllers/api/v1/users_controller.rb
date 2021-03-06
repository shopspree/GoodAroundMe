class Api::V1::UsersController < Api::V1::BaseController


  def edit
    @user = current_user
  end

  # GET /api/v1/usersjohn.doe@email.com.json
  def show
    @user = user_by_email(params[:email])
  end

  # PUT /api/v1/users/john.doe@email.com.json
  def update
    @user = user_by_email(params[:email])
    profile =  @user.person.profile

    profile.assign_attributes(first_name: params[:user][:first_name]) if params[:user][:first_name]
    profile.assign_attributes(last_name: params[:user][:last_name]) if params[:user][:last_name]
    profile.assign_attributes(thumbnail_url: params[:user][:thumbnail_url]) if params[:user][:thumbnail_url]

    render json: profile.errors, status: :unprocessable_entity unless profile.save

  end

  def update_password
    @user = User.find(current_user.id)
    unless @user.update_with_password(params[:user])
      # Sign in the user by passing validation in case his password changed
      #sign_in @user, :bypass => true
      # redirect_to root_path
      #render json: @user, only: [:email, :authentication_token, :current_sign_in_ip], status: :ok
    #else
      render json: {success: false, message: "Error with your login or password"}, status: 401
    end
  end

  def user_params
    params.required(:user).permit(:current_password, :password, :password_confirmation)
  end

  def recover_password
    @user = User.send_reset_password_instructions(params[:user])
    if successfully_sent?(@user)
      head :status => 200
    else
      render :status => 422, :json => { :errors => @user.errors.full_messages }
    end
  end


  protected

  def send_reset_password_instructions
    user = User.find_by_email(params[:email])
    user.send_reset_password_instructions
    flash[:notice] = "Reset password instructions have been sent to #{user.email}."
    redirect_to admin_user_path(user)
  end

  def user_by_email(email)
    user = if current_user && current_user.email  == email
             current_user
           else
             User.find_by_email(email)
           end
  end


end
