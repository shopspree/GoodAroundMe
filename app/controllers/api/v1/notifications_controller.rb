class Api::V1::NotificationsController < ApplicationController

  # GET /api/v1/notifications/:email.json
  def index
    user = if (params[:email])
             User.find_by_email(params[:email])
           else
             current_user
           end

    @notifications = user.actor.notifications.order('created_at DESC').limit(20)
  end

  # PUT /api/v1/notifications/:email.json
  def acknowledge
    user = if (params[:email])
             User.find_by_email(params[:email])
           else
             current_user
           end

    @notifications = user.actor.notifications.where(is_read: false)

    if @notifications.update_all(is_read: true)
      respond_with head :no_content
    else
      respond_with @notifications.errors, status: :unprocessable_entity
    end
  end
end
