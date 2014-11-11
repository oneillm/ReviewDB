require 'ostruct'
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

      @sitename = @ssdmapping.ssname.ssname
   if /twitter/=~@sitename.downcase || /google/=~ @sitename.downcase
      filepath = "public/resource/twitterdata.txt" if "#{@sitename}".downcase.include? "twitter"
      filepath = "public/resource/GoogleSample.txt" if "#{@sitename}".downcase.include? "google"
 
       dataoriginal=File.read(filepath)
       #data1=dataoriginal.gsub(\'\"'\,'"')
        #data=dataoriginal.gsub(/[<>.]/, '')
        data=dataoriginal
       result=JSON.parse(data)
       @app_url = filepath
       @msgout = "-Reading from sampled file"
       @msgcode=200
       @body = data
   else
       gethttp
       @msgout = @news.message
       @msgcode = @news.code
       @body = @news_body
       result=JSON.parse(@news_body)
   end

  @result = [] 
    @ssdmapping.attributes.each do |attr, value|
     next if "#{attr}" =='mappingid' || "#{attr}" == 'ssname' || "#{attr}" == 'ssid' || attr == 'created_at' || attr == 'updated_at' 
        unless value.blank?
               s = value.to_s.split(".")
              unless s.blank?
                  temp = Ssdmapping.recursive_select(s.last, result)
                  unless temp.blank?
                     temp.each do |r|
                        tempkey = "#{r['path'].join '.'}".to_s
                        next if @result.any? { |s| s.include? (tempkey)}
                        if tempkey.casecmp(value.to_s) == 0
                          @result[@result.length]= "Correct Mapping ~> " + tempkey + " ~> result= #{r['value']}"
                        else
                          invalid = "'" + value.to_s + "' is an invalid mapping path"
                          unless @result.include? invalid.to_s
                            @result[@result.length] = invalid.to_s
                          end
                           @result[@result.length]= "Suggest Mapping ~> " + tempkey + " ~> result= #{r['value']}"
                        end  #if
                     end #temp.each.do
                  else
                          @result[@result.length]="Cannot find any path name = '" + value.to_s + "' thus No suggestion" 
                  end #unless temp.blank
            end # unless s.blank
         end # value.blank
     end #ssdmapping   
  end  #def

def gethttp
     #@socialmediasite = current_login.socialmediasites.find(session[:ssid])
       #@ssite = Socialmediasite.where(:ssid => @ssdmapping.ssid).first 
       @ssite = @ssdmapping.ssname 
        
        busprofile = @ssite.sssearchby
        if busprofile  == 'business phone'
           busprofile = Business.first.bphone.first
        else
           busprofile = Business.first.bname.gsub(/\s+/,"+")
        end
    @app_url = [@ssite.ssurl, "#{busprofile}",@ssite.ssurlquery, @ssite.ssaccesstoken, @ssite.ssaccesstokensecretkey, @ssite.ssconsumerkey, @ssite.ssconsumersecret].compact.join("") || "http://news.google.com"
    @app_url = "http://#{@app_url}" unless @app_url.starts_with?("http")
   begin
   # Retrieve the webpage
    @news = HTTParty.get(@app_url)
    @news_body = @news.body
   rescue StandardError
     #when something goes wrong create a fallback message
    @news = OpenStruct.new(:code => nil, :message => "Invalid domain or authentication")

   end

end

  # GET /ssdmappings/new
  def new
   #  @site = current_login.socialmediasites
      siteid = Ssdmapping.pluck(:ssid)
      @site = Socialmediasite.where.not(ssid: siteid)
     @ssdmapping = Ssdmapping.new
  end

  # GET /ssdmappings/1/edit
  def edit
  end

  # POST /ssdmappings
  # POST /ssdmappings.json
  def create
    
    respond_to do |format|
        if @ssdmapping.save
           
           format.html { redirect_to @ssdmapping, notice: 'New ssdmapping was successfully created.' }
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
      #@site = current_login.socialmediasites.all
      @site = Socialmediasite.all
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ssdmapping_params
      params.require(:ssdmapping).permit(:mappingid, :ssid, :ssdcommentorid, :ssdcommentorname, :ssdcommentortimezone, :ssdpostingtimezone, :ssdcommentorlanguage, :ssdtotalreview, :ssdoverallrating, :ssdcommentorrating, :ssdcomment, :ssdpostat, :ssdcommentorloc, :postingurl)
    end
end
