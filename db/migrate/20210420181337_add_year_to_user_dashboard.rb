class AddYearToUserDashboard < ActiveRecord::Migration[6.1]
  def change
    add_column :user_dashboards, :year, :integer
  end
end
