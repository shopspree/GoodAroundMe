class UserObserver < ActiveRecord::Observer

  def before_create(user)
    # find ro create the user's organization
    organization = Organization.find_or_create_by_domain(domain user.email)
    if organization
      # get context for the user
      context = if Settings['context.global']
                  Context.find_by_name(Settings['context.global.name'])
                else
                  Context.find_or_create_by_name(organization.name)
                end

      # create the user with the proper context
      user.create_person(context_id: context.id)
    end
  end


  protected

  def domain(email)
    email.split("@").last if email
  end

end
