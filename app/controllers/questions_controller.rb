class QuestionsController < ApplicationController
  before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions
  # GET /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1
  # GET /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  def follow_user
    @user = Question.find_by(id: params[:question_id]).user
    @user_following = UserFollowing.create(user_id: current_user.id,follow_id: params[:id],question_id: params[:question_id])
    respond_to do |format|
      if @user_following.save
        format.html { redirect_to "/questions/#{@user.question_id}", notice: 'User followed successfully.' }
      else
        format.html { redirect_to "/questions/#{@user.question_id}", notice: 'Error in following user.' }
      end
    end    
  end

  def follow_topic
    @user = Question.find_by(id: params[:question_id]).user
    if !TopicFollowed.find_by(follow_id: params[:id]).present?
      @topic_followed = TopicFollowed.create(user_id: current_user.id,follow_id: params[:id],question_id: params[:question_id])
      redirect_to "/questions/#{@user.question_id}", notice: 'Topic followed successfully.'
    else
      redirect_to "/questions/#{@user.question_id}", notice: 'Topic Already following.'
    end
  end
  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    @question = Question.new(question_params)

    respond_to do |format|
      if @question.save
        format.html { redirect_to @question, notice: 'Question was successfully created.' }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1
  # PATCH/PUT /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to @question, notice: 'Question was successfully updated.' }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1
  # DELETE /questions/1.json
  def destroy
    @question.destroy
    respond_to do |format|
      format.html { redirect_to questions_url, notice: 'Question was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:name,:user_id)
    end
end
