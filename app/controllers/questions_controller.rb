# == Schema Information
#
# Table name: questions
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  room_id    :integer
#  title      :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class QuestionsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_question, only: [:show, :edit, :update, :destroy]

  # GET /questions/1
  # GET /questions/1.json
  def show
    @answers = @question.answers
    @answer = @question.answers.first
    @answer_tags = @answer.answer_tags
    @tags = []
    @answer_tags.each do |answer_tag|
      tag = Tag.find(answer_tag[:tag_id])
      @tags.push(tag)
    end
  end

  # GET /questions/new
  def new
    @room = Room.find(params[:room_id])
    @question = Question.new
    @answer = Answer.new
    @tags = Tag.all

  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions
  # POST /questions.json
  def create
    saved = false
    begin
      ActiveRecord::Base.transaction do
        @tags = params[:tags].split(",")
        @room = Room.find(params[:room_id])
        @question = Question.new(question_params)
        @question.room = @room
        @question.user = current_user
        @question.save!
        @answer = Answer.new(answer_params)
        @answer.question = @question
        @answer.user = current_user
        @answer.save!
        if !@tags.empty? # if not empty
          @tags.each do |tag|
            new_tag = Tag.where(name: tag)
            if new_tag.empty?
              new_tag = Tag.create(name: tag)
              new_tag.save!
            else
              new_tag = new_tag.first
            end
            ans_tag = AnswerTag.create(answer_id: @answer.id, tag_id: new_tag[:id])
            ans_tag.save!
          end
        end
        saved = true
      end
      rescue ActiveRecord::StatementInvalid
    end

    if saved
      flash[:notice] = "Question was successfully created."
      redirect_to room_question_path(@room, @question)
    else
      render 'questions/new'
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

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_params
      params.require(:question).permit(:title)
    end

    def answer_params
      params.require(:answer).permit(:content)
    end

    def tag_params
      params.require(:tag).permit(:name)
    end
end
