class ApplicationController < ActionController::API
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
    rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

    private

    def record_not_found(invalid)
        render json: {error: "#{invalid.model} not found"}, status: :unprocessable_entity
    end

    def record_invalid(invalid)
        render json: {errors: invalid.record.errors.full_messages}, status: :not_found
    end
    
end
