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
    @organization = Organization.new(params[:api_v1_organization])

    respond_to do |format|
      if @api_v1_organization.save
        format.json { render json: @organization, status: :created, location: @organization }
      else
        format.json {  }
      end
    end
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
    @organization = Organization.find(params[:id])
    @person = current_person

    unless @person.follows.include? @organization
      @person.follows << @organization
      @person.save
    else
      respond_with @person.errors, status: :unprocessable_entity
    end

  end

  # DELETE /api/v1/organizations/1/follow.json
  def unfollow
    @organization = Organization.find(params[:id])
    @person = current_person

    if @person.follows.include? @organization
      @person.follows.delete(@organization)
      @person.save
    else
      respond_with @person.errors, status: :unprocessable_entity
    end

  end

end
