require 'ostruct'
require 'twitter'

class SocialmediasitesController < ApplicationController
#before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
  load_and_authorize_resource
  before_action :set_socialmediasite, only: [:show, :edit, :update, :destroy]

  # GET /socialmediasites
  # GET /socialmediasites.json
  def index
      session[:index_page] = request.env['HTTP_REFERER'] || socialmediasites_url
      @socialmediasites = Socialmediasite.search(params[:search])
      @socialmediasites_array = Kaminari.paginate_array(@socialmediasites).page(params[:page]).per(2)
  end

  # GET /socialmediasites/1
  # GET /socialmediasites/1.json
  def show
     #@socialmediasite = current_login.socialmediasites.find(session[:ssid])
        busprofile = @socialmediasite.sssearchby
         if busprofile  == 'business phone'
           busprofile = Business.first.bphone.first
        else
           busprofile = Business.first.bname.gsub(/\s+/,"+")
        end

  if @socialmediasite.ssname.downcase.include? "twitter"
        @app_url = [@socialmediasite.ssurl, "#{busprofile}", @socialmediasite.ssurlquery, @socialmediasite.ssaccesstoken, @socialmediasite.ssaccesstokensecretkey, @socialmediasite.ssconsumerkey, @socialmediasite.ssconsumersecret].compact.join("") || "http://news.google.com"
   begin
      @news = twitter_client.search("#{busprofile}").take(100)
    if @news.blank?
          # @news = OpenStruct.new(:code => nil, :message => "Invalid domain or authentication")
           @news_code = 404
           @news_message = "Invalid authentication"

    else
       @news_body = @news
       @news_code = 200
       @news_message = "ok"
    end 
   end
 else
   if @socialmediasite.ssname.downcase.include? "google"
       @app_url = [@socialmediasite.ssurl, "#{busprofile}",  @socialmediasite.ssaccesstoken, @socialmediasite.ssaccesstokensecretkey, @socialmediasite.ssconsumerkey, @socialmediasite.ssconsumersecret].compact.join("") || "http://news.google.com"
       # for google needs 2 passes for place detail search, this is the 1st pass
       
       gethttp
       # check the result after 1st pass
       if @news.message.downcase.include? "ok"
           result=JSON.parse(@news_body)
           temp = Ssdmapping.recursive_select("place_id", result)
          unless temp.blank?
            # flash[:alert]  = temp[0]
             temp.each do |v|
               #flash[:alert] = "#{v['value']}"
               #find the placeid should only be the first one
               @placeid  = "#{v['value']}" if @placeid.nil?
             end
             #2nd pass after obtaining the placeid from the 1st pass
             @app_url = [@socialmediasite.ssurlquery, @placeid,  @socialmediasite.ssaccesstoken, @socialmediasite.ssaccesstokensecretkey, @socialmediasite.ssconsumerkey, @socialmediasite.ssconsumersecret].compact.join("") || "http://news.google.com"
          end
       end
   else  
        @app_url = [@socialmediasite.ssurl, "#{busprofile}", @socialmediasite.ssurlquery, @socialmediasite.ssaccesstoken, @socialmediasite.ssaccesstokensecretkey, @socialmediasite.ssconsumerkey, @socialmediasite.ssconsumersecret].compact.join("") || "http://news.google.com"
   end
    gethttp
  end
end
def gethttp
    @app_url=@app_url.gsub(/\A\p{Space}*/,'') #replace trailing or leading blank space           
    @app_url = "http://#{@app_url}" unless @app_url.starts_with?("http")
   begin
   # Retrieve the webpage
    @news = HTTParty.get(@app_url)
    @news_body = @news.body 
     rescue StandardError
     #when something goes wrong create a fallback message
    @news = OpenStruct.new(:code => nil, :message => "Invalid domain or authentication")

   end
   #trick to pretty print headers
    @news_headers = Hash[*@news.headers.to_a.flatten]
    @news_code = @news.code
    @news_message = @news.message
  
 end
def twitter_client
   Twitter::REST::Client.new do |config|
         config.consumer_key = @socialmediasite.ssconsumerkey 
         config.consumer_secret = @socialmediasite.ssconsumersecret
         config.access_token = @socialmediasite.ssaccesstoken
         config.access_token_secret = @socialmediasite.ssaccesstokensecretkey
 
   end
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
