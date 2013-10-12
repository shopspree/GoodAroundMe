class FacebookService
  def initialize
    @graph = get_graph
  end

  def import_facebook_posts(facebook_run)
    @facebook_page = facebook_run.facebook_page
    @facebook_run = facebook_run
    # query feed
    query = "feed?fields=id,object_id,type,created_time,updated_time"
    query += "&since=#{facebook_run.last_run.to_i}&until=now" if facebook_run.last_run
    feed = @graph.get_connections(@facebook_page.identifier, query)

    # iterate over feed items
    feed.each do |post|
      case post["type"]
        when "photo"
          photo_post(post)
      end
    end
  end

  def import_facebook_page(page_identifier)
    begin
      page = get_graph.get_object("#{page_identifier}?fields=about,website,picture")
    rescue Koala::Facebook::APIError => exception
      logger.error("<FacebookService>" + exception.message)
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
    params[:post][:medias_attributes] = [{url_string: photo["source"]}]
    params
  end

  def photo_post(post)
      photo = @graph.get_object("#{post["object_id"]}?fields=source,from,created_time,updated_time")
      params = post_params(photo)

      facebook_post = FacebookPost.find_or_initialize_by_facebook_object_id(post["object_id"])
      post = if facebook_post.new_record?
               actor = @facebook_page.organization.actor
               actor.posts.create(params[:post])
             elsif facebook_post.updated_time != post["updated_time"]
               facebook_post.post.update_attributes(title: params[:post][:title], caption: params[:post][:caption], medias_attributes: params[:post][:medias_attributes])
             end
      facebook_post.facebook_id = post["id"]
      facebook_post.facebook_type = post["type"]
      facebook_post.facebook_created_at = post["created_at"]
      facebook_post.facebook_updated_at = post["updated_at"]
      facebook_post.facebook_run_id =  @facebook_run.id
      facebook_post.save
  end

end