class SsdmappingsController < ApplicationController
  #before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
  load_and_authorize_resource 
  before_action :set_ssdmapping, only: [:show, :edit, :update, :destroy]

  # GET /ssdmappings
  # GET /ssdmappings.json
  def index
    #@site = current_login.socialmediasites.all
    #@ssdmappings = Ssdmapping.search(params[:search])
     @site = Ssdmapping.search(params[:search])
    @ssdmappings = @site.order(:mappingid).page(params[:page]).per(2)
    
    # session[:mappingindex_page]=request.env['HTTP_REFERER'] || ssdmappings_url
  end

  # GET /ssdmappings/1
  # GET /ssdmappings/1.json
  def show
  end

  # GET /ssdmappings/new
  def new
     @site = current_login.socialmediasites
     #@site = currentusermapping
     @ssdmapping = Ssdmapping.new
  end

  # GET /ssdmappings/1/edit
  def edit
  end

  # POST /ssdmappings
  # POST /ssdmappings.json
  def create
    @ssdmapping = Ssdmapping.new(ssdmapping_params)

    respond_to do |format|
      if @ssdmapping.save
        format.html { redirect_to @ssdmapping, notice: 'Ssdmapping was successfully created.' }
        format.json { render action: 'show', status: :created, location: @ssdmapping }
      else
        format.html { render action: 'new' }
        format.json { render json: @ssdmapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ssdmappings/1
  # PATCH/PUT /ssdmappings/1.json
  def update
    respond_to do |format|
      if @ssdmapping.update(ssdmapping_params)
        format.html { redirect_to @ssdmapping, notice: 'Ssdmapping was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @ssdmapping.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ssdmappings/1
  # DELETE /ssdmappings/1.json
  def destroy
    @ssdmapping.destroy
    respond_to do |format|
      format.html { redirect_to ssdmappings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ssdmapping
      @ssdmapping = Ssdmapping.find(params[:id])
      @site = current_login.socialmediasites.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssdmapping_params
      params.require(:ssdmapping).permit(:mappingid, :ssid, :ssdcommentorid, :ssdcommentorname, :ssdcommentortimezone, :ssdpostingtimezone, :ssdcommentorlanguage, :ssdtotalreview, :ssdoverallrating, :ssdcommentorrating, :ssdcomment, :ssdpostat, :ssdcommentorloc)
    end
end
