class ConversationsController < ApplicationController
  before_action :set_conversation, only: [:show, :edit, :update, :destroy]
  before_action :authorize_conversation

  # GET /conversations
  # GET /conversations.json
  def index
    @conversations = Conversation.all
  end

  # GET /conversations/1
  # GET /conversations/1.json
  def show
    if @conversation.user1 == current_user
      @conversation_partner = @conversation.user2
    else
      @conversation_partner = @conversation.user1
    end
  end

  # GET /conversations/new
  def new
    @conversation = Conversation.new
    @users = User.all
    @can_message = []
    @users.each do |user|
      if current_user.role.privilege == "student" && user.role.privilege == "teacher"
        @can_message << user
      elsif current_user.role.privilege == "teacher"
        @can_message = get_userbooking_users(current_user)
      end
    end
  end
 

  # GET /conversations/1/edit
  def edit
  end

  # POST /conversations
  # POST /conversations.json
  def create
    @conversation = Conversation.new(conversation_params)
    conversations = Conversation.all
    conversations.each do |convo|
      if((@conversation.user1 == convo.user1 and @conversation.user2 == convo.user2) or (@conversation.user1 == convo.user2 and @conversation.user2 == convo.user1))
        @conversation = convo
        redirect_to conversation_path(@conversation)
        return
      end
    end
   
  
      respond_to do |format|
        if @conversation.save
          format.html { redirect_to @conversation, notice: 'conversation was successfully created.' }
          format.json { render :show, status: :created, location: @conversation }
        else
          format.html { render :new }
          format.json { render json: @conversation.errors, status: :unprocessable_entity }
        end
      end

  end

  # PATCH/PUT /conversations/1
  # PATCH/PUT /conversations/1.json
  def update
    respond_to do |format|
      if @conversation.update(conversation_params)
        format.html { redirect_to @conversation, notice: 'Conversation was successfully updated.' }
        format.json { render :show, status: :ok, location: @conversation }
      else
        format.html { render :edit }
        format.json { render json: @conversation.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conversations/1
  # DELETE /conversations/1.json
  def destroy
    @conversation.destroy
    respond_to do |format|
      format.html { redirect_to conversations_url, notice: 'Conversation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conversation
      @conversation = Conversation.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def conversation_params
      # some issues on the require for params
      params.require(:conversation).permit(:user2_id, :user1_id)
    end

    def get_userbooking_users(user)
      lessons = user.lessons
      users = []
      lessons.each do |lesson|
        if lesson.userbookings
          lesson.userbookings.each do |userbooking|
            users << userbooking.user
          end
        end
      end
      return users
    end

    def authorize_conversation
      authorize(Conversation)
    end
end
