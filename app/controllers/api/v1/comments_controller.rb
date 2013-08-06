class Api::V1::CommentsController < Api::V1::BaseController

  # GET /api/v1/posts/1/comments.json
  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments.all
  end

  # GET /api/v1/posts/1/comments/1.json
  def show
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    respond_with @comment    
  end

  # POST /api/v1/posts/1/comments.json
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(params[:comment])
    @comment.actor_id = current_actor.id

    respond_with @comment.errors, status: :unprocessable_entity, location: nil unless @comment.save
  end

  # PUT /api/v1/posts/1/comments/1.json
  def update
    @comment = Post.find(params[:post_id]).comments.find(params[:id])

    if @comment.update_attributes(params[:comment])
      respond_with head :no_content
    else
      respond_with @comment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/1/comments/1.json
  # DELETE /api/v1/comments/1/comments/1.json
  def destroy
    @commentable = if params[:post_id]
                     Post.find(params[:post_id])
                   else
                     Comment.find(params[:comment_id])
                   end

    @comment = @commentable.comments.find(params[:id])
    @comment.destroy
  end
end
