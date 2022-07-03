class LeasesController < ApplicationController

    def create
        render json: Lease.create(lease_params), status: :created
    end

    def destroy
        l = Lease.find(params[:id])
        l.destroy
        head :no_content
    end

    private

    def lease_params
        params.permit(:rent, :apartment_id, :tenant_id)
    end

end
