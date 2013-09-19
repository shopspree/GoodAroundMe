module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    logger.debug("[DEBUG] <LikesHelper> in like_by_user")
    user_actor_id = user.person.actor.id
    likeable.likes.each do |like|
      logger.debug("[DEBUG] <LikesHelper> like #{like.id} actor is #{like.actor_id} while current_user actor is #{user_actor_id}")
      return like if like.actor_id == user_actor_id
    end
  end

end
