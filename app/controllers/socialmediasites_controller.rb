class SocialmediasitesController < ApplicationController
  before_action :set_socialmediasite, only: [:show, :edit, :update, :destroy]

  # GET /socialmediasites
  # GET /socialmediasites.json
  def index
    @socialmediasites = Socialmediasite.all
  end

  # GET /socialmediasites/1
  # GET /socialmediasites/1.json
  def show
     @socialmediasite = current_login.socialmediasites.find(params[:id])
  end

  # GET /socialmediasites/new
  def new
    @socialmediasite = Socialmediasite.new
  end

  # GET /socialmediasites/1/edit
  def edit
     @socialmediasite = current_login.socialmediasites.find(params[:id])
  end

  # POST /socialmediasites
  # POST /socialmediasites.json
  def create
   # @socialmediasite = Socialmediasite.new(socialmediasite_params)
     @socialmediasite = current_login.socialmediasites.build(params[:socialmediasite])
    respond_to do |format|
      if @socialmediasite.save
        format.html { redirect_to @socialmediasite, notice: 'Socialmediasite was successfully created.' }
        format.json { render action: 'show', status: :created, location: @socialmediasite }
      else
        format.html { render action: 'new' }
        format.json { render json: @socialmediasite.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /socialmediasites/1
  # PATCH/PUT /socialmediasites/1.json
  def update
    respond_to do |format|
      if @socialmediasite.update(socialmediasite_params)
        format.html { redirect_to @socialmediasite, notice: 'Socialmediasite was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @socialmediasite.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /socialmediasites/1
  # DELETE /socialmediasites/1.json
  def destroy
    @socialmediasite.destroy
    respond_to do |format|
      format.html { redirect_to socialmediasites_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_socialmediasite
     # @socialmediasite = Socialmediasite.find(params[:id])
     @socialmediasite = current_login.socialmediasites.find(params[:id])
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def socialmediasite_params
      params.require(:socialmediasite).permit(:ssid, :ssname, :ssurl, :ssurlquery, :ssaccesstoken, :ssaccesstokensecretkey, :ssconsumerkey, :ssconsumersecret, :status, :userid)
    end
end
