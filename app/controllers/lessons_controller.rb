class LessonsController < ApplicationController
  before_action :set_lesson, only: [:show, :edit, :update, :destroy]

  # GET /lessons
  # GET /lessons.json
  def index
    authorize(Lesson)
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
    authorize(Lesson)
  end

  # GET /lessons/new
  def new
    authorize(Lesson)
    @lesson = Lesson.new
  end

  # GET /lessons/1/edit
  def edit
    authorize(Lesson)
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    authorize(Lesson)
    @profile = @lesson.user.profile
  
    if @lesson.save
      redirect_to profile_path @profile
    else
      render 'new'
    end

    # find the languageskill associated with the newly created lesson
    language_skill = Languageskill.where("id = ?", params[:lesson][:languageskill_id])[0]
    # set the languageskill teaches field to true
    language_skill.teaches = true
    language_skill.save!
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    authorize(Lesson)
    respond_to do |format|
      if @lesson.update(lesson_params)
        format.html { redirect_to request.headers[“HTTP_REFERER”]}
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    authorize(Lesson)
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url}
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:user_id, :languageskill_id, :price, :duration, :description, :maxbooking)
    end

end
