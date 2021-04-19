class KpiDataController < ApplicationController
    def create
        # byebug
        @kpi_data = KpiDatum.new(kpi_data_params)
        @kpi_data.user = current_user
        @kpi_data.save
        render json: @kpi_data

    end

    private

    def kpi_data_params
        params.require(:kpi_data).permit(:date, :kpi, :data_point)
    end
end
