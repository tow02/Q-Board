# == Schema Information
#
# Table name: rooms
#
#  id         :integer          not null, primary key
#  name       :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class RoomsController < ApplicationController
  load_and_authorize_resource
  # before_action :set_room, only: [:show, :edit, :update, :destroy]

  # GET /rooms
  # GET /rooms.json
  def index
    @rooms = Room.all.order(:name)
  end

  # GET /rooms/1
  # GET /rooms/1.json
  def show
    @questions = @room.questions.paginate(:page => params[:page], :per_page => 10)
    @answers = []
    @questions.each do |question|
      @answers.push(question.answers.first)
    end
    # combine each answer with each question
    @qas = @questions.zip(@answers)

    # @answer_tags = []
    # @tags = []
    # @answers.each do |answer|
    #   answer_tags = answer.answer_tags
    #   @answer_tags.push(answer_tags)
    #   answer_tags.each do |answer_tag|
    #     tag = Tag.find(answer_tag[:tag_id])
    #     @tags.push(tag)
    #   end
    # end
    # @zz = @answer_tags.zip(@tags)
  end

  # GET /rooms/new
  def new
    @room = Room.new
  end

  # GET /rooms/1/edit
  def edit
  end

  # POST /rooms
  # POST /rooms.json
  def create
    # @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "Room was successfully created."
      redirect_to @room
    else
      render 'new'
    end

    # respond_to do |format|
    #   if @room.save
    #     format.html { redirect_to @room, notice: 'Room was successfully created.' }
    #     format.json { render :show, status: :created, location: @room }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @room.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /rooms/1
  # PATCH/PUT /rooms/1.json
  def update
    respond_to do |format|
      if @room.update(room_params)
        format.html { redirect_to @room, notice: 'Room was successfully updated.' }
        format.json { render :show, status: :ok, location: @room }
      else
        format.html { render :edit }
        format.json { render json: @room.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rooms/1
  # DELETE /rooms/1.json
  def destroy
    @room.destroy
    respond_to do |format|
      format.html { redirect_to rooms_url, notice: 'Room was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_room
    #   @room = Room.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def room_params
      params.require(:room).permit(:name)
    end
end
