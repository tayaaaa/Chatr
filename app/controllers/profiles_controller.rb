class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :edit, :update, :destroy]
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /profiles
  # GET /profiles.json
  def index
    authorize(Profile)
    @profiles = Profile.all
  end

  # GET /profiles/1
  # GET /profiles/1.json
  def show
    authorize(Profile)
    @user_reviews = user_reviews(@user)
  end

  # GET /profiles/new
  def new
    authorize(Profile)
    @profile = Profile.new
  end

  # GET /profiles/1/edit
  def edit
    authorize(Profile)
  end

  # POST /profiles
  # POST /profiles.json
  def create
    authorize(Profile)
    @profile = Profile.new(profile_params)
    if @profile.uploaded_image.attached? == false
      set_default_profile_image(@profile)
    end

    if @profile.background_image.attached? == false
      set_default_background_image(@profile)
    end
    if @profile
    redirect_to new_languageskill_path(:profile_id => @profile.id)
    end
  end

  # PATCH/PUT /profiles/1
  # PATCH/PUT /profiles/1.json
  def update
    authorize(Profile)
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to @profile, notice: 'Profile was successfully updated.' }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /profiles/1
  # DELETE /profiles/1.json
  def destroy
    authorize(Profile)
    @profile.destroy
    respond_to do |format|
      format.html { redirect_to profiles_url, notice: 'Profile was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def finances
    authorize(Profile)
    if current_user.role_id == 2
      @user_transactions = [] 
      current_user.lessons.each do |lesson|
        lesson.userbookings.each do |userbooking|
          @user_transactions << userbooking
        end
      end
    else
      @user_transactions = []
      current_user.userbookings.each do |booking|
        @user_transactions << booking
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = @profile.user
    end
    
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def profile_params
      params.require(:profile).permit(:user_id, :firstname, :lastname, :bio, :skypename, :uploaded_image, :background_image, :average_rating)
    end

    def set_default_profile_image(profile)
          profile.uploaded_image.attach(io: File.open('app/assets/images/default-user-img.png'), filename: 'default-user-img.png')
    end

    def set_default_background_image(profile)
      profile.background_image.attach(io: File.open('app/assets/images/background-image.jpg'), filename: 'background-image.jpg')
    end
  
    def user_reviews(user) 
        userbookings = []
        user.lessons.each do |lesson|
          lesson.userbookings.each do |userbooking|
              userbookings << userbooking
          end
        end
        reviews = []
        userbookings.each do |userbooking|
          if userbooking.review
            reviews << userbooking.review
          end
        end
        return reviews
    end
end
