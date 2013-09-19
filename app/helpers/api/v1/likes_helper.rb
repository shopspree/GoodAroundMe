module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    user_actor_id = user.person.actor.id

    likeable.likes.each do |like|
      if like.actor_id == user_actor_id
        logger.debug("[DEBUG] <LikesHelper> TRUE! like #{like.id} actor is #{like.actor_id} while current_user actor is #{user_actor_id}")
        return like
      else
        logger.debug("[DEBUG] <LikesHelper> FALSE! like #{like.id} actor is #{like.actor.id} while current_user actor is #{user_actor_id}")
      end

    end
  end

end
