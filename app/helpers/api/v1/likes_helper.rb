module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    like_by_user = nil

    current_actor_id =  user.person.actor.id
    likeable.likes.each do |like|
      if like.actor_id ==  current_actor_id
        like_by_user = like
        break
      end
    end

    return like_by_user
  end

end
