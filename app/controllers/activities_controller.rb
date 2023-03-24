class ActivitiesController < ApplicationController

    def index
        activities = Activity.all
        render json: activities
    end

    def destroy
        activity = Activity.find_by(id: params[:id])

        if activity 
            activity.signups.destroy_all
            activity.destroy
            head :no_content
        else
            render json: { error: "Activity not found"}, status: :not_found
        end
    end

end
