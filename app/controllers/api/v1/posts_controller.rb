class Api::V1::PostsController < Api::V1::BaseController

  # GET /api/v1/organizations/:organization_id/posts.json
  def index
    @posts = Organization.find(params[:organization_id]).actor.posts if params[:organization_id]

  end

  # GET /api/v1/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  # POST /api/v1/posts.json
  def create
    if current_person.organization
      @post = current_person.organization.actor.posts.create(params[:post])
      @post.contributor_id = current_actor.id
      mediable = if params[:photo]
                   Photo.create(params[:photo])
                 elsif params[:video]
                   Video.create(params[:video])
                 end
      mediable.media = @post.medias.create

      @user = current_user

      respond_with @post.errors, status: :unprocessable_entity unless @post.save
    end
  end

  # PUT /api/v1/posts/1.json
  def update
    @post = Post.find(params[:id])

    if @post.update_attributes(params[:post])
      respond_with head :no_content
    else
      respond_with @post.errors, status: :unprocessable_entity
    end

  end

  # DELETE /api/v1/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    #respond_with { head :no_content, location: nil }
    render json: {success: true, message: "successfully destroyed post #{params[:id]}"}.to_json, status: :ok, location: nil
  end

  # GET /api/v1/posts/popular.json
  def popular
    @posts = Post.popular
  end

  # GET /api/v1/posts/posts_by_user_id/:user_id.json
  def posts_by_user_id
    @posts = Post.posts_by_user_id(params[:user_id])

    responds_with @posts

  end

end
