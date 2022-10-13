class SpicesController < ApplicationController
    #Get

    def index
        all_spices = Spice.all
        render json: all_spices       
    end

    def create
        new_spice = Spice.create(spice_params)
        render json: new_spice , status: :created
    end

    def update
        spice = Spice.find_by(id: params[:id])
        spice.update(spice_params)
        render json: spice
    end

    def destroy
        spice = Spice.find_by(id: params[:id])
        spice.destroy
        head :no_content
    end

    private

    def spice_params
        params.permit(:title, :image, :description, :notes, :rating)
    end

end
