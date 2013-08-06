class PersonObserver < ActiveRecord::Observer

  def before_create(person)
    create_actor()
    create_profile(person)

    email = user_email(person)
    domain_name = email.split("@").last
    domain = Domain.find_by_name(domain)
    if domain
      default_follow(person, domain)
    end
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

  def default_follow(person, domain)
    organization = domain.organization
    person.follows <<  organization if organization
  end

  def user_email(person)
    user = person.user
    email = user.email
  end
end
