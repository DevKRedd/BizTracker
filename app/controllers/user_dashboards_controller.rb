class UserDashboardsController < ApplicationController
    

    def my_dashboard
        # byebug
        # dashboard = UserDashboard.all.find(params["id"])
        dashboard = UserDashboard.all.where({user_id: params["id"]})
        
            render json: dashboard
    end


    def create
        # byebug
        @user_dashboard = UserDashboard.new(user_dashboard_params)
        @user_dashboard.user = current_user
        @user_dashboard.save
        render json: @user_dashboard

    end

    def update

        @user_dashboard = UserDashboard.find(params[:user_dashboard_id])
        @user_dashboard.update(dashboard_title: user_dashboard_params[:dashboard_title], chart_type: user_dashboard_params[:chart_type], quarter_number: user_dashboard_params[:quarter_number], year: user_dashboard_params[:year]) 
        
    end

    private

    def user_dashboard_params
        params.require(:user_dashboards).permit(:dashboard_title, :chart_type, :quarter_number, :user_id, :year)
    end



end
