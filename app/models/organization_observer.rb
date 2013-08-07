class OrganizationObserver < ActiveRecord::Observer

  def after_create(organization)
    create_actor(organization)
  end


  protected

  def create_actor(organization)
    organization.create_actor(context_id: organization.context_id)
  end


end
