class Api::V1::ProblemsController < ApplicationController

  # POST /api/v1/problems.json
  def create
    @problem = Problem.new(params[:problem])

    format.json { render json: @problem.errors, status: :unprocessable_entity } unless @problem.save
  end

end
