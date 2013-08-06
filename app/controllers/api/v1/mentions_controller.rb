class Api::V1::MentionsController < Api::V1::BaseController
  
  # GET /api/v1/posts/:post_id/mentions.json
  def index
    @mentions = Post.find(params[:post_id]).mentions.all

    respond_with @mentions
  end

  # POST /api/v1/posts/:post_id/mentions.json
  def create
    @mention = Post.find(params[:post_id]).mentions.new(params[:mention])

    if @mention.save
      respond_with @mention, status: :created, location: @mention
    else
      respond_with @mention.errors, status: :unprocessable_entity
    end
  end

  # DELETE /api/v1/posts/:post_id/mentions/1.json
  def destroy
    @mention = Post.find(params[:post_id]).mentions.find(params[:id])
    @mention.destroy

    respond_with head :no_content
  end
end
