# == Schema Information
#
# Table name: room_subjects
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomSubjectsController < ApplicationController
  before_action :set_room_subject, only: [:show, :edit, :update, :destroy]

  # GET /room_subjects
  # GET /room_subjects.json
  def index
    @room_subjects = RoomSubject.all
  end

  # GET /room_subjects/1
  # GET /room_subjects/1.json
  def show
  end

  # GET /room_subjects/new
  def new
    @room_subject = RoomSubject.new
  end

  # GET /room_subjects/1/edit
  def edit
  end

  # POST /room_subjects
  # POST /room_subjects.json
  def create
    @room_subject = RoomSubject.new(room_subject_params)

    respond_to do |format|
      if @room_subject.save
        format.html { redirect_to @room_subject, notice: 'Room subject was successfully created.' }
        format.json { render :show, status: :created, location: @room_subject }
      else
        format.html { render :new }
        format.json { render json: @room_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /room_subjects/1
  # PATCH/PUT /room_subjects/1.json
  def update
    respond_to do |format|
      if @room_subject.update(room_subject_params)
        format.html { redirect_to @room_subject, notice: 'Room subject was successfully updated.' }
        format.json { render :show, status: :ok, location: @room_subject }
      else
        format.html { render :edit }
        format.json { render json: @room_subject.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /room_subjects/1
  # DELETE /room_subjects/1.json
  def destroy
    @room_subject.destroy
    respond_to do |format|
      format.html { redirect_to room_subjects_url, notice: 'Room subject was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room_subject
      @room_subject = RoomSubject.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_subject_params
      params.require(:room_subject).permit(:name)
    end
end
