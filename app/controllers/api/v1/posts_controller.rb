class Api::V1::PostsController < Api::V1::BaseController

  after_filter :post_audience, only: [:update, :create]

  # GET /api/v1/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_with @post
  end

  # POST /api/v1/posts.json
  def create
    if current_person.organization
      @post = current_person.organization.actor.posts.new(params[:post])
      @post.contributor_id = current_actor.id
      @user = current_user
    end

    respond_with @post.errors, status: :unprocessable_entity unless @post.save

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
