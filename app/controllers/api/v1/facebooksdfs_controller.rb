class Api::V1::FacebooksdfsController < ApplicationController
  # GET /api/v1/facebooksdfs
  # GET /api/v1/facebooksdfs.json
  def index
    @api_v1_facebooksdfs = Api::V1::Facebooksdf.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @api_v1_facebooksdfs }
    end
  end

  # GET /api/v1/facebooksdfs/1
  # GET /api/v1/facebooksdfs/1.json
  def show
    @api_v1_facebooksdf = Api::V1::Facebooksdf.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @api_v1_facebooksdf }
    end
  end

  # GET /api/v1/facebooksdfs/new
  # GET /api/v1/facebooksdfs/new.json
  def new
    @api_v1_facebooksdf = Api::V1::Facebooksdf.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @api_v1_facebooksdf }
    end
  end

  # GET /api/v1/facebooksdfs/1/edit
  def edit
    @api_v1_facebooksdf = Api::V1::Facebooksdf.find(params[:id])
  end

  # POST /api/v1/facebooksdfs
  # POST /api/v1/facebooksdfs.json
  def create
    @api_v1_facebooksdf = Api::V1::Facebooksdf.new(params[:api_v1_facebooksdf])

    respond_to do |format|
      if @api_v1_facebooksdf.save
        format.html { redirect_to @api_v1_facebooksdf, notice: 'Facebooksdf was successfully created.' }
        format.json { render json: @api_v1_facebooksdf, status: :created, location: @api_v1_facebooksdf }
      else
        format.html { render action: "new" }
        format.json { render json: @api_v1_facebooksdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /api/v1/facebooksdfs/1
  # PUT /api/v1/facebooksdfs/1.json
  def update
    @api_v1_facebooksdf = Api::V1::Facebooksdf.find(params[:id])

    respond_to do |format|
      if @api_v1_facebooksdf.update_attributes(params[:api_v1_facebooksdf])
        format.html { redirect_to @api_v1_facebooksdf, notice: 'Facebooksdf was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @api_v1_facebooksdf.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /api/v1/facebooksdfs/1
  # DELETE /api/v1/facebooksdfs/1.json
  def destroy
    @api_v1_facebooksdf = Api::V1::Facebooksdf.find(params[:id])
    @api_v1_facebooksdf.destroy

    respond_to do |format|
      format.html { redirect_to api_v1_facebooksdfs_url }
      format.json { head :no_content }
    end
  end
end
