class LanguageskillsController < ApplicationController
  before_action :set_languageskill, only: [:show, :edit, :update, :destroy]
  before_action :language_names_array, only: [:new, :edit, :create, :update]


  # GET /languageskills
  # GET /languageskills.json
  def index
    authorize(Languageskill)
    @languageskills = Languageskill.all
  end

  # GET /languageskills/new
  def new
    authorize(Languageskill)
    @languageskill = Languageskill.new
  end

  # GET /languageskills/1/edit
  def edit
    if not (current_user and Languageskill.find(params[:id]).profile.user_id == current_user.id)
      authorize(Languageskill)
    end
  end

  # POST /languageskills
  # POST /languageskills.json
  def create
    @languageskill = Languageskill.new(languageskill_params)
    respond_to do |format|
      if @languageskill.save
        format.html { render :success }
      end
    end
  end

  # PATCH/PUT /languageskills/1
  # PATCH/PUT /languageskills/1.json
  def update
    respond_to do |format|
      if @languageskill.update(languageskill_params)
        format.html { redirect_to userbookings_path}
        format.json { render :show, status: :ok, location: @languageskill }
      else
        format.html { render :edit }
        format.json { render json: @languageskill.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /languageskills/1
  # DELETE /languageskills/1.json
  def destroy
    authorize(Languageskill)
    @languageskill.destroy
    respond_to do |format|
      format.html { redirect_to languageskills_url}
      format.json { head :no_content }
    end
  end

  private
    def language_names_array
      languagesarray= HTTParty.get("https://restcountries.eu/rest/v2/all?fields=languages")
      langnames = []
      languagesarray.each do |languagehash|
        languagehash["languages"].each do |languagedetails|
          langnames << languagedetails["name"]
        end
      end
      langnames.sort_by!{|langname| langname}
      @languagenames = langnames.uniq
    end
  
    # Use callbacks to share common setup or constraints between actions.
    def set_languageskill
      @languageskill = Languageskill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def languageskill_params
      params.require(:languageskill).permit(:profile_id, :teaches, :proficiency, :language_name)
    end
end
