class ApartmentsController < ApplicationController
    
    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: Apartment.find(params[:id]), status: :ok
    end

    def create
        render json: Apartment.create(apartment_params), status: :created
    end

    def update
        a = Apartment.find(params[:id])
        a.update(apartment_params)
        render json: a, status: :ok
    end

    def destroy
        a = Apartment.find(params[:id])
        a.destroy
        head :no_content
    end

    private

    def apartment_params
        params.permit(:number)
    end

end
