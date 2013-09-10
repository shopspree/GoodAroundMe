class Ability
  include CanCan::Ability

  def initialize(user)
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities

    if user.person
      person = user.person
      actor = person.actor

      # Activity
      can :read, Activity # anyone can read the activity

      # Post
      can :create,  Post do |post|
        !person.orgnization.nil? # can create post if is assigned to an organization
      end
      can [:update, :destroy], Post do |post|
        post.actor_id == person.organization.actor_id  # can update or destroy post on organization they are assigned
      end
      can [:read, :popular], Post # anyone can read posts

      # Comment
      can [:read, :create], Comment # anyone can create a comment
      can :update,  Comment, actor_id: actor.id  # can update comment they own
      can :destroy, Comment do |comment|
        (comment.actor_id == actor.id) ||
            (comment.post.actor_id == person.organization.actor_id if person.organization) # can destroy comment they own or for post they own
      end

      # Like
      can [:read, :create], Like # anyone can like
      can :destroy, Like, actor_id: actor.id  # can destroy like they own

      # Inappropriate
      can :create,  InappropriateReport # anyone can report inappropriate

      # Notification
      can [:read, :acknowledge],  Notification, actor_id: actor.id # can read self profile notification

      # User
      can [:read, :following], User
      can [:update, :update_password], User, id: user.id

      #Organization
      can [:read, :follow, :unfollow, :followers],   Organization
      can [:create], Organization do |organization|
        person.operator && person.organization.nil?
      end
      can [:update], Organization do |organization|
        person.organization == organization
      end

      #OrganizationCategory
      can [:read],   OrganizationCategory

      # Mention
      #can [:create, :read], Mention do |mention|
      #  can_actor_read_post? actor, mention.post # can create/read mention on post they can read
      #end
      #can :destroy, Mention, actor_id: actor.id # can destroy mention they own

      # Category
      #can :read,    Category

      # Subcategory
      #can [:create, :read], Subcategory


    end
  end


  protected

  def can_actor_read_post?(actor, post)
    case post.audience_type.name
      when Audience::TYPES[:organization]
        post.actor.context_id == actor.context_id
      when Audience::TYPES[:organization]
        post.actor == actor
      else
        false
    end
  end


end
