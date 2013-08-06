module Api::V1::LikesHelper

  def liked_by_user?(likeable, user)
    likeable.likes.each do |like|
      return true if like.actor == user.actor
    end

    false
  end

end
