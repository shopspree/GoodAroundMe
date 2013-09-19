module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    user_actor_id = user.person.actor.id

    likeable.likes.each do |like|
      logger.debug("[DEBUG] <LikesHelper> like #{like.id} actor is #{like.actor.id} while current_user actor is #{user_actor_id}")
      if like.actor_id == user_actor_id
        return like
      end

    end
  end

end
