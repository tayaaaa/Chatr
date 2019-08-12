class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    authorize(Review)
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    authorize(Review)
  end

  # GET /reviews/new
  def new
    if Userbooking.find(params[:id]).review == nil and (Userbooking.find(params[:id]).user_id == current_user.id)
      @review = Review.new
    else
      authorize(Review)
    end
  end

  # GET /reviews/1/edit
  def edit
    authorize(Review)
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @review = Review.new(review_params)
    @teacher = get_teacher(@review)
 
    respond_to do |format|
      if @review.save
        @review.save!
        @teacher.profile.update_average_rating
        format.html { redirect_to userbookings_path, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @teacher = get_teacher(@review)
    respond_to do |format|
      if @review.update(review_params)
        @teacher.profile.update_average_rating
        format.html { redirect_to userbookings_path, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    authorize(Review)
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:userbooking_id, :stars, :content, :date_published)
    end

    def get_teacher(review)
      review.userbooking.lesson.user
    end
end
