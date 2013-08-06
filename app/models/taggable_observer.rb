class TaggableObserver < ActiveRecord::Observer
  observe :post, :comment

  def after_create(object)
    regex = /\S*#(?:\[[^\]]+\]|\S+)/

    if object.respond_to? :hashtags
      # get hashtag from taggable object
      hashtag_keys = Array.new
      if object.is_a? Post
        hashtag_keys = object.content.scan regex  if object.content
      elsif object.is_a? Comment
        hashtag_keys = object.content.scan regex  if object.content
      end

      hashtag_keys.each do |key|
        hashtag = Hashtag.find_or_initialize_by_key(key)

        if hashtag.new_record?
          # get the actor for this object
          actor = object.actor

          # get the organization id for this object actor
          context_id = object.actor.context_id

          hashtag.update_attributes(actor_id: actor.id, context_id: context_id)
          hashtag.save
        end

        object.hashtags << hashtag
      end
    end

  end

end
