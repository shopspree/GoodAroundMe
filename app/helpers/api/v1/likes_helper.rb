module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    likeable.likes.each do |like|
      return like if like.actor == user.person.actor
    end
  end

end
