class Api::V1::OrganizationCategoriesController < Api::V1::BaseController

  # GET /api/v1/organization_categories.json
  def index
    @organization_categories = Api::V1::OrganizationCategory.all
  end

end
