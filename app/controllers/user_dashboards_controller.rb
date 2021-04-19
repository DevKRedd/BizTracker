class UserDashboardsController < ApplicationController

    def create
        # byebug
        @user_dashboard = UserDashboard.new(user_dashboard_params)
        @user_dashboard.user = current_user
        @user_dashboard.save
        render json: @user_dashboard

    end

    def update

        @user_dashboard = UserDashboard.find(params[:user_dashboard_id])
        @user_dashboard.update(params[:user_dashboard_id])
        
    end

    private

    def user_dashboard_params
        params.require(:kpi_data).permit(:dashboard_title, :chart_type, :quarter_number)
    end


end
