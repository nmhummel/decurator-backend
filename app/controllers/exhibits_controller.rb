class ExhibitsController < ApplicationController
  before_action :set_exhibit, only: [:show, :update, :destroy]

  # GET /exhibits
  def index
    @exhibits = Exhibit.all

    render json: @exhibits
  end

  # GET /exhibits/1
  def show
    render json: @exhibit
  end

  # POST /exhibits
  def create
    @exhibit = Exhibit.new(exhibit_params)

    if @exhibit.save
      render json: @exhibit, status: :created, location: @exhibit
    else
      render json: @exhibit.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /exhibits/1
  def update
    if @exhibit.update(exhibit_params)
      render json: @exhibit
    else
      render json: @exhibit.errors, status: :unprocessable_entity
    end
  end

  # DELETE /exhibits/1
  def destroy
    @exhibit.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exhibit
      @exhibit = Exhibit.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def exhibit_params
      params.require(:exhibit).permit(:name, :room_id, :painting_id)
    end
end
