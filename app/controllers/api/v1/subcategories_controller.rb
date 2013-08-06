class Api::V1::SubcategoriesController < Api::V1::BaseController

  # GET /api/v1/categories/:id/subcategories.json
  # GET /api/v1/subcategories.json
  def index
    @category = Category.find(params[:category_id]) if params[:category_id]

    @subcategories = if @category
                       @category.subcategories.where(context_id: current_actor.context_id).order("posts_count DESC") unless current_actor.nil?
                     else
                       Subcategory.where(context_id: current_actor.context_id).order("posts_count DESC") unless current_actor.nil?
                     end
  end

  # POST /api/v1/categories/:id/subcategories.json
  def create
    @category = Category.find(params[:category_id])
    @subcategory = @category.subcategories.new(params[:Subcategory])
    @subcategory.actor_id = current_actor.id

    render json: @subcategory.errors, status: :unprocessable_entity unless @subcategory.save
  end
end
