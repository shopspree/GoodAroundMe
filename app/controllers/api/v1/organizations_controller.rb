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

  # POST /api/v1/organizations.json
  def create
    @organization = Organization.new(params[:organization])

    respond_with @organization.errors, status: :unprocessable_entity unless @organization.save
  end

  # PUT /api/v1/organizations/1.json
  def update
    @organization = Organization.find(params[:id])

    if @organization.update_attributes(params[:organization])
      respond_with head :no_content
    else
      respond_with @organization.errors, status: :unprocessable_entity
    end
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
      @person.following.delete(@organization)
      @person.save
    else
      render json: {success: false, errors: "Not following #{@organization.name} from first place"}, status: :unprocessable_entity
    end

  end

end
