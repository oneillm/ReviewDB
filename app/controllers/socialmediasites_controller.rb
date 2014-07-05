class SocialmediasitesController < ApplicationController
  before_action :set_socialmediasite, only: [:show, :edit, :update, :destroy]

  # GET /socialmediasites
  # GET /socialmediasites.json
  def index
      session[:index_page] = request.env['HTTP_REFERER'] || socialmediasites_url
      @socialmediasites = Socialmediasite.search(params[:search])
  end

  # GET /socialmediasites/1
  # GET /socialmediasites/1.json
  def show
     #@socialmediasite = current_login.socialmediasites.find(session[:ssid])
  end

  # GET /socialmediasites/new
  def new
    @socialmediasite = current_login.socialmediasites.new
  end

  # GET /socialmediasites/1/edit
  def edit
    # @socialmediasite = current_login.socialmediasites.find(session[:ssid])
  end

  # POST /socialmediasites
  # POST /socialmediasites.json
  def create
   # @socialmediasite = Socialmediasite.new(socialmediasite_params)
   #  @socialmediasite = current_login.socialmediasites.build(params[:socialmediasite])
     @socialmediasite = current_login.socialmediasites.new(socialmediasite_params)
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
#      @socialmediasite = Socialmediasite.by_login(current_login).find(params[:ssid])
     @socialmediasite = Socialmediasite.find(params[:id])
   end

    # Never trust parameters from the scary internet, only allow the white list through.
    def socialmediasite_params
      params.require(:socialmediasite).permit(:ssid, :ssname, :ssurl, :ssurlquery, :ssaccesstoken, :ssaccesstokensecretkey, :ssconsumerkey, :ssconsumersecret, :status, :sssearchby,:login_id)
    end
end
