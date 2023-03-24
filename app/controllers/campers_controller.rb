class CampersController < ApplicationController
rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
    def index
        camper = Camper.all 
        render json: camper
    end

    def show 
        camper = Camper.find(params[:id])
        render json: camper
    end

    def create 
        camper = Camper.create(camper_params)
        # render json: camper
        if camper.valid?
            app_response(status: :created, data: camper)
        else
            app_response(status: :uprocessable_entity, data: camper.errors, message: 'validation errors')
        end
    end

    private

    def camper_params
        params.permit(:name, :age)
    end

    def render_not_found_response
        render json: { error: "Camper not found"}, status: :not_found
    end

    def app_response(status:, data:, message: nil)
        { status: status, data: data, message: message }.compact
    end
end
