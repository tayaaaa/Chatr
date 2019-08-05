class UserbookingsController < ApplicationController
  before_action :set_userbooking, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /userbookings
  # GET /userbookings.json
  def index
    @all_userbooking_cards = [[],[]]
    userbookings = Userbooking.all.where(user_id: current_user.id)
    userbookings.each do |booking|
      card_information = {
        userbooking: booking,
        picture: booking.lesson.user.profile,
        teacher: booking.lesson.user.profile.firstname,
        language: booking.lesson.languageskill.language_name,
        date: booking.date_booked,
        note: booking.note,
        description: booking.lesson.description,
        duration: booking.lesson.duration,
        complete: booking.completedstu
      }
      if card_information[:complete] == true
        @all_userbooking_cards[1] << card_information
      else 
        @all_userbooking_cards[0] << card_information
      end
    end
    puts @all_userbooking_cards
  end

  # GET /userbookings/1
  # GET /userbookings/1.json
  def show
  end

  def completelesson
    userbooking = Userbooking.find(params[:id])
    userbooking.completedstu = true
    userbooking.save!
    redirect_to request.headers["HTTP_REFERER"]
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
      params.require(:userbooking).permit(:user_id, :lesson_id, :note, :date_booked, :completedstu, :completedteach, :amountpaid)
    end
end
