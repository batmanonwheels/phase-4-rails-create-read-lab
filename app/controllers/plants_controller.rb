class PlantsController < ApplicationController
  def index

    render json: Plant.all
  end

  def show
    plant = Plant.find_by(id: params[:id])
    if plant
      render json: plant, except: [:created_at, :updated_at]
    else
      render json: { error: 'Plant not found' }
    end
  end

  def create
    plant = Plant.create(plant_params)
    render json: plant
  end

  private

  def plant_params
    params.permit(:name, :image, :price )
  end
end
