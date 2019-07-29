class UserbookingsController < ApplicationController
  before_action :set_userbooking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /userbookings
  # GET /userbookings.json
  def index
    @userbookings = Userbooking.all
  end

  # GET /userbookings/1
  # GET /userbookings/1.json
  def show
  end

  # GET /userbookings/new
  def new
    @userbooking = Userbooking.new
  end

  # GET /userbookings/1/edit
  def edit
  end

  # POST /userbookings
  # POST /userbookings.json
  def create
    @userbooking = Userbooking.new(userbooking_params)

    respond_to do |format|
      if @userbooking.save
        format.html { redirect_to @userbooking, notice: 'Userbooking was successfully created.' }
        format.json { render :show, status: :created, location: @userbooking }
      else
        format.html { render :new }
        format.json { render json: @userbooking.errors, status: :unprocessable_entity }
      end
    end
    
  end

  # PATCH/PUT /userbookings/1
  # PATCH/PUT /userbookings/1.json
  def update
    respond_to do |format|
      if @userbooking.update(userbooking_params)
        format.html { redirect_to @userbooking, notice: 'Userbooking was successfully updated.' }
        format.json { render :show, status: :ok, location: @userbooking }
      else
        format.html { render :edit }
        format.json { render json: @userbooking.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /userbookings/1
  # DELETE /userbookings/1.json
  def destroy
    @userbooking.destroy
    respond_to do |format|
      format.html { redirect_to userbookings_url, notice: 'Userbooking was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = current_user
    end

    def set_userbooking
      @userbooking = Userbooking.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def userbooking_params
      params.require(:userbooking).permit(:user_id, :lesson_id, :note, :date_booked, :completedstu, :completedteach)
    end
end
