class PersonObserver < ActiveRecord::Observer

  def after_create(person)
    create_actor(person)
    create_profile(person)
    assign_organization(person)
    default_follow(person)
  end


  protected

  def create_actor(person)
    person.create_actor(context_id: person.context_id)
  end

  def create_profile(person)
    email = user_email(person)
    person.create_profile(email: email) unless person.profile
  end

  def assign_organization(person)
    email = user_email(person)
    org_operator = Operator.find_by_email(email)
    organization = org_operator.organziation if org_operator
    person.organization = organization
  end

  def default_follow(person)
    organization = person.organization
    person.follows <<  organization if organization
  end

  def user_email(person)
    user = person.user
    email = user.email
  end
end
