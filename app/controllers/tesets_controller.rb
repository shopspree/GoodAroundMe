class TesetsController < ApplicationController
  # GET /tesets
  # GET /tesets.json
  def index
    @tesets = Teset.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tesets }
    end
  end

  # GET /tesets/1
  # GET /tesets/1.json
  def show
    @teset = Teset.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @teset }
    end
  end

  # GET /tesets/new
  # GET /tesets/new.json
  def new
    @teset = Teset.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @teset }
    end
  end

  # GET /tesets/1/edit
  def edit
    @teset = Teset.find(params[:id])
  end

  # POST /tesets
  # POST /tesets.json
  def create
    @teset = Teset.new(params[:teset])

    respond_to do |format|
      if @teset.save
        format.html { redirect_to @teset, notice: 'Teset was successfully created.' }
        format.json { render json: @teset, status: :created, location: @teset }
      else
        format.html { render action: "new" }
        format.json { render json: @teset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tesets/1
  # PUT /tesets/1.json
  def update
    @teset = Teset.find(params[:id])

    respond_to do |format|
      if @teset.update_attributes(params[:teset])
        format.html { redirect_to @teset, notice: 'Teset was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @teset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tesets/1
  # DELETE /tesets/1.json
  def destroy
    @teset = Teset.find(params[:id])
    @teset.destroy

    respond_to do |format|
      format.html { redirect_to tesets_url }
      format.json { head :no_content }
    end
  end
end
