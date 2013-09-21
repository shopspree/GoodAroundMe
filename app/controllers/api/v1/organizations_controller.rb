class Api::V1::OrganizationsController < Api::V1::BaseController

  # GET /api/v1/organizations.json
  def index
    @organizations = if params[:organizations_category_id]
                       OrganizationCategory.find(params[:organizations_category_id]).organizations if OrganizationCategory.find(params[:organizations_category_id])
                     else
                       Organization.all
                     end
  end

  # GET /api/v1/organizations/1.json
  def show
    @organization = Organization.find(params[:id])
  end

  # POST /api/v1/organization_categories/:organization_category_id/organizations.json
  def create
    @organization = if params[:organization_category_id]
                      OrganizationCategory.find(params[:organization_category_id]).organizations.new(params[:organization]) if OrganizationCategory.find(params[:organization_category_id])
                    else
                      Organization.new(params[:organization])
                    end

    @organization.followers << current_person
    @organization.operators << current_person.operator if current_person.operator

    respond_with @organization.errors, status: :unprocessable_entity unless @organization.save
  end

  # PUT /api/v1/organizations/1.json
  def update
    @organization = Organization.find(params[:id])
    @organization.assign_attributes(params[:organization])

    if (params[:organization][:organization_category])
      @organization.organization_organization_categories.clear
      @organization.organization_categories << OrganizationCategory.find(params[:organization][:organization_category])
    end

    respond_with @organization.errors, status: :unprocessable_entity unless @organization.save
  end

  # DELETE /api/v1/organizations/1.json
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  # POST /api/v1/organizations/1/follow.json
  def follow
    @organization = Organization.find(params[:organization_id])
    @person = current_person

    unless @person.following.include? @organization
      @person.following << @organization
      @person.save
    else
      render json: {success: false, errors: "Already following #{@organization.name}"}, status: :unprocessable_entity
    end

  end

  # DELETE /api/v1/organizations/1/follow.json
  def unfollow
    @organization = Organization.find(params[:organization_id])
    @person = current_person

    if @person.following.include? @organization
      @person.following.destroy(@organization)
      @person.save
    else
      render json: {success: false, errors: "Not following #{@organization.name} from first place"}, status: :unprocessable_entity
    end

  end

  # GET /api/v1/organizations/1/followers.json
  def followers
    @organization = Organization.find(params[:organization_id])
  end

end
