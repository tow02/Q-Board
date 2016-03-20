# == Schema Information
#
# Table name: answers
#
#  id          :integer          not null, primary key
#  question_id :integer
#  user_id     :integer
#  content     :text
#  is_question :boolean
#  is_accepted :boolean
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class AnswersController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:upvote, :downvote]
  # before_action :set_answer, only: [:show, :edit, :update, :destroy]

  # GET /answers
  # GET /answers.json
  def index
    @answers = Answer.all
  end

  # GET /answers/1
  # GET /answers/1.json
  def show
  end

  # GET /answers/new
  def new
    @answer = Answer.new
  end

  # GET /answers/1/edit
  def edit
  end

  # POST /answers
  # POST /answers.json
  def create
    @answer = Answer.new
    @answer[:content] = params[:content]
    @question_id = params[:question_id].to_i
    @answer[:question_id] = @question_id
    @answer[:user_id] = current_user.id
    @question = Question.find(@question_id)

    respond_to do |format|
      if @answer.save
        # format.html { redirect_to @answer, notice: 'Answer was successfully created.' }
        format.html { redirect_to room_question_path(@question.room, @question), notice: 'Answer was successfully created.' }
        format.json { render :show, status: :created, location: @answer }
      else
        # format.html { render :new }
        format.html { redirect_to room_question_path(@question.room, @question), notice: "Content can't be blank" }
        format.json { render json: @answer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answers/1
  # PATCH/PUT /answers/1.json
  def update
    @answer = Answer.find(params[:id])
    @answer.content = params[:answer][:content]
    @question = Question.find(@answer.question_id)
      if @answer.save
        flash[:notice] = "Answer was successfully updated."
        redirect_to room_question_path(@question.room, @question)
      else
        redirect_to :back
      end
  end

  # DELETE /answers/1
  # DELETE /answers/1.json
  def destroy
    @answer.destroy
    respond_to do |format|
      format.html { redirect_to answers_url, notice: 'Answer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def upvote
    @answer = Answer.find(params[:id])
    authorize! :vote, @answer
    @answer.upvote_by current_user
    @user = User.find(@answer[:user_id])
    @answers = Answer.where(user_id: @user.id)
    total_reputation = 0
    @answers.each do |answer|
      total_reputation += answer.score
    end
    @user.reputation = total_reputation
    @user.save!
    redirect_to :back
  end

  def downvote
    @answer = Answer.find(params[:id])
    authorize! :vote, @answer
    @answer.downvote_by current_user
    @user = User.find(@answer[:user_id])
    @answers = Answer.where(user_id: @user.id)
    total_reputation = 0
    @answers.each do |answer|
      total_reputation += answer.score
    end
    @user.reputation = total_reputation
    @user.save!
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer
      @answer = Answer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def answer_params
    #   params.require(:answer).permit(:content)
    # end
end
