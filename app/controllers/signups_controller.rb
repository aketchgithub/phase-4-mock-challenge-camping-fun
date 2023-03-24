class SignupsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response

    def create
        signup = Signup.new(signup_params)

        if signup.save
            render json: signup, status: :created
        else 
            render json: { error: signup.errors.full_mesages }, status: :uprocessable_entity
        end
    end 

    private
    def signup_params
        params.require(:signup).permit(:time, :camper_id, :activity_id)
    end

    def render_not_found_response
        render json: { error: "validation errors" }, status: :not_found
    end


end
