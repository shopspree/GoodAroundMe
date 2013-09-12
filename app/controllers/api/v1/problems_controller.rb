class Api::V1::ProblemsController < Api::V1::BaseController

  # POST /api/v1/problems.json
  def create
    @problem = Problem.new(params[:problem])
    @problem.actor_id = current_actor.id

    format.json { render json: @problem.errors, status: :unprocessable_entity } unless @problem.save
  end

end
