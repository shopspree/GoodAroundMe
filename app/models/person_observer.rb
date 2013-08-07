class PersonObserver < ActiveRecord::Observer

  def after_create(person)
    create_actor(person)
    create_profile(person)

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

  def create_job_profile(person)
    email = user_email(person)
    person.create_job_profile(email: email) unless person.job_profile
  end

  def default_follow(person)
    email = user_email(person)
    domain_name = email.split("@").last
    domain = Domain.find_by_name(domain_name)

    organization = domain.organization if domain
    person.follows <<  organization if organization
  end

  def user_email(person)
    user = person.user
    email = user.email
  end
end
