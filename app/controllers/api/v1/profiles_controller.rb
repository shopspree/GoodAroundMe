class Api::V1::ProfilesController < Api::V1::BaseController

  # GET /api/v1/profiles/email/john.doe@email.com.json
  def show
    user = user_by_email(params[:email])

    if user
      @profile = user.actor.profile
      @job_profile = user.actor.job_profile
      @groups = user.actor.groups
    end

  end

  # PUT /api/v1/profiles/email/john.doe@email.com.json
  def update
    user = user_by_email(params[:email])

    user.actor.profile.update_attributes(params[:profile])

    user.actor.job_profile.update_attributes(params[:job_profile])

    unless params[:group][:name].nil?
      group = Group.find_or_create_by_name_and_context_id(params[:group][:name], user.actor.context_id)
      if user.actor.groups.empty?
        user.actor.groups << group
      else
        user.actor.groups
        user.actor.groups << group
      end
    end

    render json: user.errors, status: :unprocessable_entity unless user.save

  end

  # GET /api/v1/profiles/search/:keyword.json
  def search
    @profiles = if (params[:keyword].size < 4)
                  Profile.search_exact(params[:keyword]).page(params[:page])
                else
                  Profile.search(params[:keyword]).page(params[:page])
                end
  end


  protected

  def user_by_email(email)
    user = if current_user && current_user.email  == email
             current_user
           else
             User.find_by_email(email)
           end
  end
end
