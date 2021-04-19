class FixUserDashboard < ActiveRecord::Migration[6.1]
  def change
    rename_column :user_dashboards, :uquarter_number, :quarter_number
  end
end
