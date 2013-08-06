class Api::V1::CategoriesController < Api::V1::BaseController

  # GET /api/v1/categories.json
  def index
    @categories = Category.order(:name)
  end
end
