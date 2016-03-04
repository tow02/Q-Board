# == Schema Information
#
# Table name: question_tags
#
#  id          :integer          not null, primary key
#  question_id :integer
#  tag_id      :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class QuestionTagsController < ApplicationController
  before_action :set_question_tag, only: [:show, :edit, :update, :destroy]

  # GET /question_tags
  # GET /question_tags.json
  def index
    @question_tags = QuestionTag.all
  end

  # GET /question_tags/1
  # GET /question_tags/1.json
  def show
  end

  # GET /question_tags/new
  def new
    @question_tag = QuestionTag.new
  end

  # GET /question_tags/1/edit
  def edit
  end

  # POST /question_tags
  # POST /question_tags.json
  def create
    @question_tag = QuestionTag.new(question_tag_params)

    respond_to do |format|
      if @question_tag.save
        format.html { redirect_to @question_tag, notice: 'Question tag was successfully created.' }
        format.json { render :show, status: :created, location: @question_tag }
      else
        format.html { render :new }
        format.json { render json: @question_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_tags/1
  # PATCH/PUT /question_tags/1.json
  def update
    respond_to do |format|
      if @question_tag.update(question_tag_params)
        format.html { redirect_to @question_tag, notice: 'Question tag was successfully updated.' }
        format.json { render :show, status: :ok, location: @question_tag }
      else
        format.html { render :edit }
        format.json { render json: @question_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_tags/1
  # DELETE /question_tags/1.json
  def destroy
    @question_tag.destroy
    respond_to do |format|
      format.html { redirect_to question_tags_url, notice: 'Question tag was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_tag
      @question_tag = QuestionTag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def question_tag_params
      params.require(:question_tag).permit(:question_id, :tag_id)
    end
end
