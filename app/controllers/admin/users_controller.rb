class Admin::UsersController < Admin::AdminController

  # GET /admin/users
  def index
    @users = User.all
  end

  # GET /admin/users/1
  def show
    @user = User.find(params[:id])
  end

  # DELETE /admin/users/1
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end

  # PUT /admin/users/approve
  def approve
    if params[:user_ids]
      params[:user_ids].each do |id|
        user = User.find(id)
        unless user.approved?
          user.approve
          user.approver = current_user
          UserMailer.approval_email(user).deliver if user.save
        end
      end
    end


    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end

  # PUT /admin/users/wait_listing
  def wait_listing
    if params[:user_ids]
      params[:user_ids].each do |id|
        user = User.find(params[:id])
        if user.approved?
          user.wait_listing
          user.save
        end

      end
    end

    respond_to do |format|
      format.html { redirect_to admin_users_url }
    end
  end
end
