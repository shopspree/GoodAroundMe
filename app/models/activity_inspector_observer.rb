class ActivityInspectorObserver < ActiveRecord::Observer
  observe :post, :comment, :like

  def after_create(object)
    if object.respond_to? :activity
      # get the organization actor id for this object
      actor_id = object.actor_id

      # get the organization context id for this object actor
      context_id = object.actor.context_id

      # create the activity from the above collected attributes
      activity = object.build_activity(context_id: context_id, actor_id: actor_id)
      activity.save!

    end

  end


end
