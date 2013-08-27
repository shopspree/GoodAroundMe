class Api::V1::ActivitiesController < Api::V1::BaseController

  respond_to :json

  # GET /api/v1/activities.json
  # GET /api/v1/post/:post_id/activities.json
  # GET /api/v1/organizations/:organizations_id/activities.json
  def index
    @activities = if params[:post_id]
                    [Post.find(params[:post_id]).activity]
                  elsif params[:organizations_id]
                    [Organization.find(params[:organizations_id]).actor.activities]
                  else
                    page = params[:activity] ? params[:activity][:page] : 1
                    Activity.from_followed_by(current_person).page(page) if current_person
                  end
    @user = current_user
  end


  # GET /api/v1/activities/1.json
  def show
    @activity = Activity.find(params[:id])
  end

end
