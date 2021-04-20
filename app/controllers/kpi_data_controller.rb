class KpiDataController < ApplicationController
    before_action :authorized

    def get_kpi
        # byebug
        # dashboard = UserDashboard.all.find(params["id"])
        this_user = User.all.find(params["id"]) 
        case params["quarter_number"]
        when 1
            kpi_datum = this_user.quarter_1(params["year"], params["kpi"])
        when 2
            kpi_datum = this_user.quarter_2(params["year"], params["kpi"])
        when 3
            kpi_datum = this_user.quarter_3(params["year"], params["kpi"])
        when 4
            kpi_datum = this_user.quarter_4(params["year"], params["kpi"])
        else
            kpi_datum = "no data"
        end
        # kpi_datum = KpiDatum.all.where({user_id: params["id"], quarter_number})
        
            render json: kpi_datum
    end
    
    
    def create
        # byebug
        @kpi_data = KpiDatum.new(kpi_data_params)
        @kpi_data.user = current_user
        @kpi_data.save
        render json: @kpi_data

    end

    private

    def kpi_data_params
        params.require(:kpi_data).permit(:date, :kpi, :data_point, :user_id)
    end
end
