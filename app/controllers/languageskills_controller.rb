class LanguageskillsController < ApplicationController
  before_action :set_languageskill, only: [:show, :edit, :update, :destroy]

  # GET /languageskills
  # GET /languageskills.json
  def index
    @languageskills = Languageskill.all
  end

  # GET /languageskills/1
  # GET /languageskills/1.json
  def show
  end

  # GET /languageskills/new
  def new
    @languageskill = Languageskill.new
  end

  # GET /languageskills/1/edit
  def edit
  end

  # POST /languageskills
  # POST /languageskills.json
  def create
    @languageskill = Languageskill.new(languageskill_params)

    respond_to do |format|
      if @languageskill.save
        format.html { redirect_to @languageskill, notice: 'Languageskill was successfully created.' }
        format.json { render :show, status: :created, location: @languageskill }
      else
        format.html { render :new }
        format.json { render json: @languageskill.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /languageskills/1
  # PATCH/PUT /languageskills/1.json
  def update
    respond_to do |format|
      if @languageskill.update(languageskill_params)
        format.html { redirect_to @languageskill, notice: 'Languageskill was successfully updated.' }
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
    @languageskill.destroy
    respond_to do |format|
      format.html { redirect_to languageskills_url, notice: 'Languageskill was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_languageskill
      @languageskill = Languageskill.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def languageskill_params
      params.require(:languageskill).permit(:references, :teaches, :proficiency)
    end
end
