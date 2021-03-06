class Admin::OrganizationsController < Admin::AdminController

  before_filter :categories

  # GET /organizations
  def index
    @organizations = Organization.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  # GET /organizations/1
  def show
    @organization = Organization.find(params[:id])
  end

  # GET /organizations/new
  def new
    @organization = Organization.new
  end

  # GET /organizations/1/edit
  def edit
    @organization = Organization.find(params[:id])
  end

  # POST /organizations
  def create
    @organization = Organization.new(params[:organization])

    # assign organization to categories
    params[:categories].each do |category|
      @organization.organization_categories << OrganizationCategory.find(category)
    end

    # assign facebook page if found
    @organization.create_facebook_page(identifier: params["facebook_page"]) if params["facebook_page"]

    respond_to do |format|
      if @organization.save
        format.html { redirect_to @organization, notice: 'Organization was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /organizations/1
  def update
    @organization = Organization.find(params[:id])

    # assign facebook page if found
    @organization.facebook_page.update_attributes(identifier: params["facebook_page"]) if params["facebook_page"]

    # assign organization to categories
    params[:categories].each do |category|
      @organization.organization_categories.clear
      @organization.organization_categories << OrganizationCategory.find(category)
    end

    respond_to do |format|
      if @organization.update_attributes(params[:organization])
        format.html { redirect_to @organization, notice: 'Organization was successfully updated.' }
      else
        format.html { render action: "edit" }
      end
    end
  end

  # DELETE /organizations/1
  def destroy
    @organization = Organization.find(params[:id])
    @organization.destroy

    respond_to do |format|
      format.html { redirect_to organizations_url }
      format.json { head :no_content }
    end
  end


  protected

  def categories
    @organization_categories = OrganizationCategory.all
  end

end
