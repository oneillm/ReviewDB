class BusinessesController < ApplicationController
 # before_filter {|controller| controller.instance_variable_set(:@authorized, true) if controller.devise_controller?}
  load_and_authorize_resource 
 before_action :set_business, only: [:show, :edit, :update, :destroy]
#  before_filter :authenticate_login!   # , :except => [:show, :index]
  # GET /businesses
  # GET /businesses.json
  
  def index
    @businesses = Business.search(params[:search])
    @paginatable_array = Kaminari.paginate_array(@businesses).page(params[:page]).per(2)  
 # Business.search method implement in the model level app/models/business.rb
    respond_to do |format|
       format.html
       format.csv { send_data @businesses.to_csv }
       format.xls # { send_data @businesses.to_csv(col_sep: "\t") }
    end
  end

  # GET /businesses/1
  # GET /businesses/1.json
  def show
  end

  # GET /businesses/new
  def new
    @business = Business.new
  end

  # GET /businesses/1/edit
  def edit
  end

  # POST /businesses
  # POST /businesses.json
  def create
    @business = Business.new(business_params)

    respond_to do |format|
      if @business.save
        format.html { redirect_to @business, notice: 'Business was successfully created.' }
        format.json { render action: 'show', status: :created, location: @business }
      else
        format.html { render action: 'new' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /businesses/1
  # PATCH/PUT /businesses/1.json
  def update
    respond_to do |format|
      if @business.update(business_params)
        format.html { redirect_to @business, notice: 'Business was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @business.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /businesses/1
  # DELETE /businesses/1.json
  def destroy
    @business.destroy
    respond_to do |format|
      format.html { redirect_to businesses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_business
      @business = Business.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def business_params
      #unless params["business"]["bphone"].nil?
      params["business"]["bphone"] = params["business"]["bphone"].to_s.gsub(/[{}\\\\"]/,'').to_s.gsub('[','').to_s.gsub(']','')
      params["business"]["bphone"] = params["business"]["bphone"].split(",")
      params.require(:business).permit(:bid, :bname, :btype, :blatitude, :blongitude, :bstreet, :bcity, :bstate, :bzip, :bcountry, :bstatus, :bphone => [])
    end
end
