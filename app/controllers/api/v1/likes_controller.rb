class Api::V1::LikesController < Api::V1::BaseController

  before_filter :set_user

  # GET /api/v1/posts/1/likes.json
  # GET /api/v1/comments/1/likes.json
  def index
    @likeable = if params[:post_id]
               Post.find(params[:post_id])
             else
               Comment.find(params[:comment_id])
             end

    @likes = @likeable.likes.all
  end

  # GET /api/v1/posts/1/likes/1.json
  # GET /api/v1/comments/1/likes/1.json
  def show
    @likeable = if params[:post_id]
              Post.find(params[:post_id])
            else
              Comment.find(params[:comment_id])
            end

    @likeable.likes.find(params[:id])
  end

  # POST /api/v1/posts/1/likes.json
  # POST /api/v1/comments/1/likes.json
  def create
    @likeable = if params[:post_id]
              Post.find(params[:post_id])
            else
              Comment.find(params[:comment_id])
            end
    like = @likeable.likes.new(params[:like])
    like.actor_id = current_actor.id

    respond_with like.errors, status: :unprocessable_entity, location: nil unless like.save

    @likeable.reload
    logger.debug("[DEBUG] <LikesController> Create: Likes count on post #{ @likeable.likes_count}")

  end

  # PUT /api/v1/posts/1/likes/1.json
  # PUT /api/v1/comments/1/likes/1.json
  def update
    @like = if params[:post_id]
              Post.find(params[:post_id]).likes.find(params[:id])
            else
              Comment.find(params[:comment_id]).likes.find(params[:id])
            end

    if @like.update_attributes(params[:like])
        respond_with { head :no_content }
    else
        respond_with { render json: @like.errors, status: :unprocessable_entity }
    end
  end

  # DELETE /api/v1/posts/1/likes/1.json
  # DELETE /api/v1/comments/1/likes/1.json
  def destroy
    like = if params[:post_id]
              Post.find(params[:post_id]).likes.find(params[:id])
            else
              Comment.find(params[:comment_id]).likes.find(params[:id])
            end
    @likeable = like.likeable

    like.destroy

    @likeable.reload

    logger.debug("[DEBUG] <LikesController> destroy: Likes count on post #{ @likeable.likes_count}")


    #render { head :no_content, status: :no_content, location: nil }
  end


  protected

  def set_user
    @user = current_user
  end
end
