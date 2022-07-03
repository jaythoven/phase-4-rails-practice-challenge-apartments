class TenantsController < ApplicationController
    # rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    # rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    def index
        render json: Tenant.all, adapter: nil, except: [:created_at, :updated_at], status: :ok
    end

    def show
        render json: Tenant.find(params[:id]), status: :ok
    end

    def create
        render json: Tenant.create!(tenant_params), status: :created
    end

    def update
        t = Tenant.find(params[:id])
        t.update!(tenant_params)
        render json: t, status: :ok
    end

    def destroy
        t = Tenant.find(params[:id])
        t.destroy
        head :no_content
    end

    private

    def tenant_params
        params.permit(:name, :age)
    end

    # def record_not_found(invalid)
    #     render json: {error: "#{invalid.model} not found"}, status: :unprocessable_entity
    # end

    # def record_invalid(invalid)
    #     render json: {errors: invalid.record.errors.full_messages}, status: :not_found
    # end

end
