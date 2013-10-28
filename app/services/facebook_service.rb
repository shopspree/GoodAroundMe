class FacebookService
  def initialize
    @graph = get_graph
  end

  def import_facebook_posts(facebook_run, incremental = true)
    @facebook_page = facebook_run.facebook_page
    @facebook_run = facebook_run
    # query feed
    query = "feed?fields=id,object_id,type,created_time,updated_time"
    query += "&since=#{facebook_run.last_run.to_i}&until=now" if (facebook_run.last_run && incremental)
    feed = @graph.get_connections(@facebook_page.identifier, query)

    # iterate over feed items
    Rails.logger.info "[INFO] Facebook SDK for query \n\t#{query} \n\treturned #{feed.length} results"
    feed.each do |feed_item|
      case feed_item["type"]
        when "photo"
          photo_post(feed_item)
      end
    end
  end

  def import_facebook_page(page_identifier)
    begin
      page = get_graph.get_object("#{page_identifier}?fields=about,website,picture")
    rescue Koala::Facebook::APIError => exception
      Rails.logger.error("<FacebookService>" + exception.message)
    end
  end


  protected

  def get_graph
    Koala::Facebook::API.new(get_access_token)
  end

  def get_access_token
    app_id = ENV["FACEBOOK_APP_ID"]
    app_secret = ENV["FACEBOOK_APP_SECRET"]
    callback_url = nil

    oauth = Koala::Facebook::OAuth.new(app_id, app_secret, callback_url)
    oauth.get_app_access_token
  end

  def facebook_service_actor
    Robot.find_or_create_by_name("Facebook").actor
  end

  def post_params(photo)
    params = Hash.new
    params[:post] = Hash.new
    params[:post][:title] = if photo["from"]["name"]
                              photo["from"]["name"].split(" ").first(5).join(" ")
                            else
                              "Posted on facebook"
                            end
    params[:post][:caption] = photo["from"]["name"]
    params[:photo][:url] = photo["source"]
    params
  end

  def photo_post(feed_item)
    query = "#{feed_item["object_id"]}?fields=source,from,created_time,updated_time"
    Rails.logger.info "[INFO] Object query #{query}"
    photo = @graph.get_object(query)
    params = post_params(photo)

    facebook_post = FacebookPost.find_or_initialize_by_facebook_object_id(feed_item["object_id"])
    post = if facebook_post.new_record?
             Rails.logger.info "[INFO] Create new FacebookPost record"
             actor = @facebook_page.organization.actor
             facebook_post.post = actor.posts.create(params[:post])

             facebook_post.post
           elsif facebook_post.facebook_updated_at != feed_item["updated_time"]
             Rails.logger.info "[INFO] Update existing FacebookPost record"
             facebook_post.post.update_attributes(title: params[:post][:title], caption: params[:post][:caption])
             post.medias.destroy
             facebook_post.post
           end

    mediable = Photo.create(params[:photo])
    mediable.media = post.medias.create

    actor = facebook_service_actor
    post.update_attributes(contributor_id: actor.id)

    facebook_post.facebook_id = feed_item["id"]
    facebook_post.facebook_type = feed_item["type"]
    facebook_post.facebook_created_at = photo["created_time"]
    facebook_post.facebook_updated_at = photo["updated_time"]
    facebook_post.facebook_run_id =  @facebook_run.id

    if facebook_post.save
      Rails.logger.info "[INFO] FacebookPost #{facebook_post.id} created successfully"
    else
      Rails.logger.error "[ERROR] FacebookPost for post #{post.id} failed to save"
    end
  end

end