class RoomsController < ApplicationController
  before_action :set_room, only: [:show, :update, :destroy]

  # GET /rooms
  def index
    rooms = Room.order(:id)
    render json: rooms.to_json(except: [:created_at, :updated_at], include: :paintings) 
  end

  # GET /rooms/1
  def show
    #@paintings = Painting.all.uniq
    render json: @room.to_json(except: [:created_at, :updated_at], include: :paintings) 
  end

  # POST /rooms
  def create
    room = Room.new(room_params)

    if room.save
      render json: room.to_json(except: [:created_at, :updated_at], include: :paintings), status: :created, location: room
    else
      render json: room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rooms/1
  def update
    # byebug
    @room.paintings << Painting.find(params[:painting_id])
    if @room.save
      render json: @room.to_json(except: [:created_at, :updated_at], include: :paintings) 
    else
      render json: @room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rooms/1
  def destroy
    @room.destroy
    render json: @room.to_json(except: [:created_at, :updated_at])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def room_params
      params.require(:room).permit(:name, :painting_id, :id)
    end
end
