class UserObserver < ActiveRecord::Observer

  def after_create(user)
    # get context for the user
    context = if Settings['context.global']
                Context.find_by_name(Settings['context.global.name'])
              else
                # find ro create the user's organization
                domain = Domain.find_or_create_by_name(domain user.email)
                organization = domain.organization if domain
                Context.find_or_create_by_name(organization.name) if organization
              end

    # create the user with the proper context
    user.create_person(context_id: context.id) if context
  end


  protected

  def domain(email)
    email.split("@").last if email
  end

end
