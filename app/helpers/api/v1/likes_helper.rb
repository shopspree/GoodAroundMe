module Api::V1::LikesHelper

  def like_by_user(likeable, user)
    likeable.likes.each do |like|
      return like if like.actor.id == User.find_by_email('asaf.ach@gmail.com').person.actor.id
    end
  end

end
