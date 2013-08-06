class NotificationInspectorObserver < ActiveRecord::Observer

  observe :comment, :like

  def after_create(object)
    case object
      when Like
        like_notification object
      when Comment
        comment_notification object
      else
        nil
    end
  end


  protected

  def like_notification(like)
    if like.likeable.is_a? Post
      post = like.post
      notify_post_actor(post) unless post.actor == like.actor
    elsif like.likeable.is_a? Comment
      comment = like.comment
      notify_comment_actor(comment) unless comment.actor == like.actor
    end
  end

  def comment_notification(comment)
    post = comment.post
    unless comment.actor == post.actor
      notify_post_actor post, actor

      comment_actors = Array.new
      post.comments.each do |post_comment|
        unless comment_actors.include? post_comment.actor
          comment_actors << post_comment.actor
          notify_comment_actor post_comment
        end
      end
    end

  end

  def notify_post_actor(post)
    actor = post.actor
    post.notifications.create(actor_id: actor.id)
  end

  def notify_comment_actor(comment)
    actor = comment.actor
    comment.notifications.create(actor_id: actor.id)
  end

end
