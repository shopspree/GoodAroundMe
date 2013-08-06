class Api::V1::InappropriateReportsController < Api::V1::BaseController

  # POST /api/v1/posts/1/inappropriate.json
  # POST /api/v1/comment/1/inappropriate.json
  def create
    @inappropriate_report = if params[:post_id]
                              Post.find(params[:post_id]).inappropriate_reports.new(params[:inappropriate_report])
                            else
                              Comment.find(params[:comment_id]).inappropriate_reports.new(params[:inappropriate_report])
                            end
    @inappropriate_report.actor_id = current_actor.id

    render json: @inappropriate_report.errors, status: :unprocessable_entity unless @inappropriate_report.save
  end

end
