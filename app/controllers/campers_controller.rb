class CampersController < ApplicationController
    def index
        camper = Camper.all 
        render json: camper
    end
end
