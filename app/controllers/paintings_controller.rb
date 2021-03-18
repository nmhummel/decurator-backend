class PaintingsController < ApplicationController

  # GET /paintings
  def index
    paintings = Painting.order(:artist).limit(10)
    page_number = params[:pagelimit]
  
    # if params[pagelimit] - keep track of in reducer
    # paintings = paintings.slice((params[pagelimit]), 20))
    render json: paintings.to_json(except: [:created_at, :updated_at]) 
  end

  # GET /paintings/1
  def show
    @painting = Painting.find(params[:id])
    render json: @painting.to_json(except: [:created_at, :updated_at]) 
  end

  
  private
    # Only allow a list of trusted parameters through.
    def painting_params
      params.require(:painting).permit(:title, :artist, :artistBio, :gender, :date, :medium, :artUrl, :imageUrl)
    end
end
